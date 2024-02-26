//
//  VideoCapture.swift
//  WorkOutUpdatedUI
//
//  Created by Jovane Samuels on 1/31/24.
//

import Foundation
import AVFoundation

class VideoCapture: NSObject {
    let captureSession = AVCaptureSession()
    let videoOutput = AVCaptureVideoDataOutput()
    let predictor: Predictor

    init(workoutType: String) {
        predictor = Predictor(workoutType: workoutType)
        
        guard let captureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back),
              let input = try? AVCaptureDeviceInput(device: captureDevice)
        else {
            super.init()
            return
        }

        super.init() 

        captureSession.sessionPreset = .high
        captureSession.addInput(input)
        captureSession.addOutput(videoOutput)
        videoOutput.alwaysDiscardsLateVideoFrames = true
    }

    func startCaptureSession() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.captureSession.startRunning()
        }
        videoOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoDispatchQueue"))
    }
    
}

extension VideoCapture: AVCaptureVideoDataOutputSampleBufferDelegate {
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        predictor.estimation(sampleBuffer: sampleBuffer)
    }
}
