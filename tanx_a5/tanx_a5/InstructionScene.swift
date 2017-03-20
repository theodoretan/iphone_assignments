//
//  InstructionScene.swift
//  tanx_a5
//
//  Created by Theodore Tan on 2017-03-20.
//  Copyright © 2017 Theodore Tan. All rights reserved.
//

import GameplayKit
import SpriteKit
import UIKit

class InstructionScene: SKScene {
    private let backButtonLabel = SKLabelNode(fontNamed: Settings.font);
    private var contentCreated = false;
    
    override func didMove(to view: SKView) {
        if (!self.contentCreated) {
            self.createContent();
            self.contentCreated = true;
        }
    }
    
    func createContent() {
        let instructions = SKLabelNode(fontNamed: Settings.font);
        instructions.fontColor = SKColor.black;
        instructions.text = Settings.instructions;
        instructions.position = CGPoint(x: self.frame.midX, y: self.size.height/2);
        
        self.addChild(instructions);
        
        backButtonLabel.fontSize = CGFloat(Settings.endFontSize);
        backButtonLabel.text = Settings.backButton;
        backButtonLabel.fontColor = SKColor.black;
        backButtonLabel.position = CGPoint(x: self.frame.midX, y: self.size.height/3);
        
        self.addChild(backButtonLabel);
        
        self.backgroundColor = SKColor.white;
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            let location = t.location(in: self);
            
            if backButtonLabel.contains(location) {
                
                if let scene = SKScene(fileNamed: Settings.game) {
                    // Set the scale mode to scale to fit the window
                    scene.scaleMode = .aspectFill
                    
                    // Present the scene
                    view?.presentScene(scene, transition: SKTransition.doorway(withDuration: 1.0))
                }
            }
        }
    }
}
