//
//  Predictor.swift
//  pushinuikit
//
//  Created by Jovane Samuels on 7/16/23.
//

import Foundation
import Vision

protocol PredictorDelegate: AnyObject {
    func predictor(predictor: Predictor,didFindNewRecognizedPoints points: [CGPoint])
    func predictor(predictor: Predictor, didLabelAction action: String, with confidence: Double)
}
enum WorkoutType: String {
    case pushUp = "PushUp"
    case sitUp = "SitUp"
    case jumpingJack = "JumpingJack"
    // Add more cases as needed
}


class Predictor {
    var workoutType: String


    
    weak var delegate: PredictorDelegate?
    
    let predictionWindowSize = 30
    var posesWindow: [VNHumanBodyPoseObservation] = []
    
    init(workoutType: String){
        self.workoutType = workoutType
        posesWindow.reserveCapacity(predictionWindowSize)
    }


    func estimation(sampleBuffer: CMSampleBuffer){
        let requestHandler = VNImageRequestHandler(cmSampleBuffer: sampleBuffer, orientation: .up)
        
        let request = VNDetectHumanBodyPoseRequest(completionHandler: bodyPoseHandler)
        
        do{
            try requestHandler.perform([request])
        }catch{
            print("Unable to perform the request, with error: \(error)")
        }
    }
    
    func bodyPoseHandler(request: VNRequest, error: Error?){
        guard let observations = request.results as? [VNHumanBodyPoseObservation] else{return}
        
        observations.forEach{
            processObservation(observation: $0)
        }
        
        if let result = observations.first{
            storeObservation(observation: result)
            
            labelActionType()
        }
    }
    
    func prepareInputWithObservations(observations: [VNHumanBodyPoseObservation]) -> MLMultiArray? {
        let numAvailableFrames = observations.count
        let observationsNeeded = 30
        if workoutType == "Push Ups"{
            let observationsNeeded = 30
        }else if workoutType == "Situps"{
            
        }


        var multiArrayBuffer =  [MLMultiArray]()
        
        for frameIndex in 0 ..< min(numAvailableFrames, observationsNeeded){
            let pose = observations[frameIndex]
            do{
                let oneFrameMultiArray = try pose.keypointsMultiArray()
                multiArrayBuffer.append(oneFrameMultiArray)
            } catch{
                continue
            }
        }
        
        if numAvailableFrames < observationsNeeded {
            for _ in 0 ..< (observationsNeeded - numAvailableFrames){
                do{
                    let oneFrameMultiArray = try MLMultiArray(shape: [1,3,18], dataType: .double)
                    try resetMultiArray(predictionWindow: oneFrameMultiArray)
                    multiArrayBuffer.append(oneFrameMultiArray)
                }catch{
                    continue
                }
            }
        }
        return MLMultiArray(concatenating: [MLMultiArray](multiArrayBuffer), axis: 0, dataType: .float)
    }
    
    func resetMultiArray(predictionWindow: MLMultiArray, with value: Double = 0.0) throws {
        let pointer = try UnsafeMutableBufferPointer<Double>(predictionWindow)
        pointer.initialize(repeating: value)
    }
    
    func labelActionType() {
        guard let poseMultiArray = prepareInputWithObservations(observations: posesWindow) else {
            return
        }
        
        switch workoutType {
        case "Push Ups":
            guard let pushUpClassifier = try? PushUp(configuration: MLModelConfiguration()),
                  let predictions = try? pushUpClassifier.prediction(poses: poseMultiArray)
            else { return }

            let label = predictions.label
            let confidence = predictions.labelProbabilities[label] ?? 0
            delegate?.predictor(predictor: self, didLabelAction: "PushUp", with: confidence)
            
        case "Sit Ups":
            guard let sitUpClassifier = try? SitUp(configuration: MLModelConfiguration()),
                  let predictions = try? sitUpClassifier.prediction(poses: poseMultiArray)
            else { return }

            let label = predictions.label
            let confidence = predictions.labelProbabilities[label] ?? 0
            delegate?.predictor(predictor: self, didLabelAction: "SitUp", with: confidence)
            
        case "Jumping Jacks":
            guard let jumpingJackClassifier = try? JumpingJack(configuration: MLModelConfiguration()),
                  let predictions = try? jumpingJackClassifier.prediction(poses: poseMultiArray)
            else { return }

            let label = predictions.label
            let confidence = predictions.labelProbabilities[label] ?? 0
            delegate?.predictor(predictor: self, didLabelAction: "JumpingJack", with: confidence)
            
        // Add more cases as needed, matching the names in ChallengeData.swift
        default:
            print("Unknown workout type: \(workoutType)")
        }
    }


    
    func storeObservation(observation: VNHumanBodyPoseObservation){
        if posesWindow.count >= predictionWindowSize{
            posesWindow.removeFirst()
        }
        posesWindow.append(observation)
    }
    func processObservation ( observation: VNHumanBodyPoseObservation){
        do{
            let recognizedPoints = try observation.recognizedPoints(forGroupKey: .all)
            
            let displayPoints = recognizedPoints.map {
                CGPoint(x: $0.value.x, y: $0.value.y)
            }

            
            delegate?.predictor(predictor: self, didFindNewRecognizedPoints: displayPoints)
        }catch{
            print("Error finding recognizedPoints")
        }
    }
}


