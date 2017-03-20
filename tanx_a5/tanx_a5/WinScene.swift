//
//  WinScene.swift
//  tanx_a5
//
//  Created by Theodore Tan on 2017-03-20.
//  Copyright © 2017 Theodore Tan. All rights reserved.
//

import Foundation

import UIKit
import SpriteKit

class WinScene: SKScene {
    private var contentCreated = false;
    
    override func didMove(to view: SKView) {
        if (!self.contentCreated) {
            self.createContent();
            self.contentCreated = true;
            _ = Timer.scheduledTimer(timeInterval: Settings.waitTime, target: self, selector: #selector(WinScene.endGame), userInfo: nil, repeats: false);
        }
    }
    
    func createContent() {
        let winLabel = SKLabelNode(fontNamed: Settings.font);
        winLabel.fontSize = CGFloat(Settings.endFontSize);
        winLabel.fontColor = SKColor.white;
        winLabel.text = Settings.win;
        winLabel.position = CGPoint(x: self.size.width/2, y: self.size.height/1.5);
        
        self.addChild(winLabel);
        
        self.backgroundColor = SKColor.black;
    }
    
    func endGame() {
        if (self.contentCreated) {
            if let scene = SKScene(fileNamed: Settings.game) {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill;
                
                // Present the scene
                view?.presentScene(scene, transition: SKTransition.doorway(withDuration: Settings.transition));
            }
        }
    }
    
}
