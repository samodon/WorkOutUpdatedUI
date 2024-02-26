import Foundation
import UIKit
import AVFoundation
import AudioToolbox
class ViewController: UIViewController {
    let videoCapture: VideoCapture
    var previewLayer: AVCaptureVideoPreviewLayer?
    var pointsLayer = CAShapeLayer()
    var isWorkoutDetected = false
    var workoutCount = 0
    var userData: UserData
    var workoutType: String


    var workoutLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false // Enable Auto Layout
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .white
        return label
    }()

    init(workoutType: String, userData: UserData) {
        self.videoCapture = VideoCapture(workoutType: workoutType)
        self.workoutType = workoutType
        self.userData = userData
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupVideoPreview()
        view.addSubview(workoutLabel)
        NSLayoutConstraint.activate([
            workoutLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
            workoutLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -12)
        ])
        videoCapture.predictor.delegate = self
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        previewLayer?.frame = view.bounds
        pointsLayer.frame = view.bounds
    }

    private func setupVideoPreview() {
        videoCapture.startCaptureSession()
        previewLayer = AVCaptureVideoPreviewLayer(session: videoCapture.captureSession)
        guard let previewLayer = previewLayer else {return}
        
        view.layer.addSublayer(previewLayer)
        previewLayer.frame = view.bounds
        previewLayer.videoGravity = .resizeAspect  // Set the videoGravity property here.
        
        view.layer.addSublayer(pointsLayer)
        pointsLayer.frame = view.bounds
        pointsLayer.strokeColor = UIColor.green.cgColor
    }
    }
    extension ViewController: PredictorDelegate{
    func predictor(predictor: Predictor, didLabelAction action: String, with confidence: Double) {
        if !isWorkoutDetected{
        //    print("sawg")
        //    print(workoutType)
        }
        print(action)
        if action == "PushUp" && confidence > 0.90 && !isWorkoutDetected {
            print("(workoutType) detected")
            isWorkoutDetected = true
            workoutCount += 1

            DispatchQueue.main.async {
                self.workoutLabel.text = "Push Up Count: \(self.workoutCount)"
                
                // Animate the label
                let animation = CABasicAnimation(keyPath: "transform.scale")
                animation.duration = 0.15
                animation.repeatCount = 1
                animation.autoreverses = true
                animation.fromValue = 1
                animation.toValue = 1.2
                self.workoutLabel.layer.add(animation, forKey: "transform.scale")
                
                AudioServicesPlayAlertSound(SystemSoundID(1322))
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
                self.isWorkoutDetected = false
            }
        }else if action == "SitUp" && confidence > 0.99 && !isWorkoutDetected{
            isWorkoutDetected = true
            workoutCount += 1

                    DispatchQueue.main.async {
                        self.workoutLabel.text = "Sit Up Count: \(self.workoutCount)"
                        
                        // Animate the label
                        let animation = CABasicAnimation(keyPath: "transform.scale")
                        animation.duration = 0.15
                        animation.repeatCount = 1
                        animation.autoreverses = true
                        animation.fromValue = 1
                        animation.toValue = 1.2
                        self.workoutLabel.layer.add(animation, forKey: "transform.scale")
                        
                        AudioServicesPlayAlertSound(SystemSoundID(1322))
                    }
                    
            DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                        self.isWorkoutDetected = false
                    }
            
        }else if action == "JumpingJack" && confidence > 0.95 && !isWorkoutDetected{
            isWorkoutDetected = true
            workoutCount += 1

                    DispatchQueue.main.async {
                        self.workoutLabel.text = "Jumping Jack Count: \(self.workoutCount)"
                        
                        // Animate the label
                        let animation = CABasicAnimation(keyPath: "transform.scale")
                        animation.duration = 0.15
                        animation.repeatCount = 1
                        animation.autoreverses = true
                        animation.fromValue = 1
                        animation.toValue = 1.2
                        self.workoutLabel.layer.add(animation, forKey: "transform.scale")
                        
                        AudioServicesPlayAlertSound(SystemSoundID(1322))
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                        self.isWorkoutDetected = false
                    }
            
        }
        else {
            print(" ")
        }
    }

        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            
            // Directly update the high score for the mainUser
            userData.updateHighScore(activity: workoutType, newScore: workoutCount)
            print("Updated score for \(workoutType) to \(workoutCount)")
        }




    func predictor(predictor: Predictor, didFindNewRecognizedPoints points: [CGPoint]) {
        
        
        guard let previewLayer = previewLayer else {return}
        
        let convertedPoints = points.map{
            previewLayer.layerPointConverted(fromCaptureDevicePoint: $0)
        }
        
        // Debugging code
        //print("Original points: \(points)")
        //print("Converted points: \(convertedPoints)")
        
        let combinedPath = CGMutablePath()
        
        for point in convertedPoints{
            let dotPath = UIBezierPath(ovalIn: CGRect(x: point.x, y: point.y, width: 10, height: 10))
            combinedPath.addPath(dotPath.cgPath)
        }
        
        pointsLayer.path = combinedPath
        
        DispatchQueue.main.async {
            self.pointsLayer.didChangeValue(for: \.path)
        }
    }
    }

