//
//  SpriteKitView.swift
//  WorkOutUpdatedUI
//
//  Created by Jovane Samuels on 2/12/24.
//

import SwiftUI
import SpriteKit

class GameScene: SKScene {
    override func didMove(to view: SKView) {
        // Set up physics world's gravity
        self.physicsWorld.gravity = CGVector(dx: 0.0, dy: -9.8) // Earth's gravity
        
        // Create the medicine ball
        let ball = SKShapeNode(circleOfRadius: 50) // Adjust radius as needed
        ball.position = CGPoint(x: frame.midX, y: frame.midY)
        ball.fillColor = .blue
        
        // Add physics body to the ball
        ball.physicsBody = SKPhysicsBody(circleOfRadius: 50)
        ball.physicsBody?.isDynamic = true
        ball.physicsBody?.restitution = 0.8 // Bounciness factor
        
        // Add the ball to the scene
        addChild(ball)
        
        // Create scene boundary so the ball doesn't bounce off-screen
        let borderBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        self.physicsBody = borderBody
    }
}


struct SpriteKitView: UIViewRepresentable {
    func makeUIView(context: Context) -> SKView {
        let view = SKView()
        // Disable multiple touch
        view.isMultipleTouchEnabled = false
        
        // Create and configure the scene
        let scene = GameScene(size: view.bounds.size)
        scene.scaleMode = .resizeFill
        
        // Present the scene
        view.presentScene(scene)
        
        return view
    }
    
    func updateUIView(_ uiView: SKView, context: Context) {
    }
}

#Preview {
    SpriteKitView()
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
}
