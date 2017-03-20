//
//  MenuScene.swift
//  tanx_a5
//
//  Created by Theodore Tan on 2017-03-15.
//  Copyright © 2017 Theodore Tan. All rights reserved.
//

import GameplayKit
import SpriteKit
import UIKit

class MenuScene: SKScene {
    
    private var contentCreated = false;
    
    private let playGameLabel = SKLabelNode(fontNamed: Settings.font);
    private let instructionsLabel = SKLabelNode(fontNamed: Settings.font);
    private let playMusicLabel = SKLabelNode(fontNamed: Settings.font);
    private let stopMusicLabel = SKLabelNode(fontNamed: Settings.font);
    
    override func didMove(to view: SKView) {
        if (!self.contentCreated) {
            self.createContent();
            self.contentCreated = true;
            _ = MusicPlayer();
        }
    }
    
    func createContent() {
        // define labels
        // use SKLabelNode
        
        playGameLabel.fontSize = CGFloat(Settings.bigFont);
        playGameLabel.fontColor = SKColor.black;
        playGameLabel.text = Settings.playLabel;
        playGameLabel.position = CGPoint(x: self.frame.midX, y: self.size.height/5);
        
        
        instructionsLabel.fontSize = CGFloat(Settings.smallFont);
        instructionsLabel.fontColor = SKColor.black;
        instructionsLabel.text = Settings.instructionsLabel;
        instructionsLabel.position = CGPoint(x: self.frame.midX, y: self.size.height/15);
        
        
        playMusicLabel.fontSize = CGFloat(Settings.smallFont);
        playMusicLabel.fontColor = SKColor.black;
        playMusicLabel.text = Settings.pMusicLabel;
        playMusicLabel.position = CGPoint(x: self.frame.midX, y: -self.size.height/15);
        
        
        stopMusicLabel.fontSize = CGFloat(Settings.smallFont);
        stopMusicLabel.fontColor = SKColor.black;
        stopMusicLabel.text = Settings.sMusicLabel;
        stopMusicLabel.position = CGPoint(x: self.frame.midX, y: -self.size.height/5);
        
        
        self.addChild(playGameLabel);
        self.addChild(instructionsLabel);
        self.addChild(playMusicLabel);
        self.addChild(stopMusicLabel);
        if MusicPlayer.musicPlayer.isPlaying() {
            MusicPlayer.musicPlayer.playMusic();
        }
        self.backgroundColor = SKColor.white;
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // check which label was touched and do stuff from there
        for t in touches {
            let location = t.location(in: self);
            
            if playGameLabel.contains(location) {
                let playGameScene: GameScene = GameScene(size: self.size);
                playGameScene.scaleMode = .aspectFill
                view?.presentScene(playGameScene, transition: SKTransition.doorsOpenHorizontal(withDuration: 1.0));
            } else if instructionsLabel.contains(location) {
                let instructionScene: InstructionScene = InstructionScene(size: self.size);
                view?.presentScene(instructionScene, transition: SKTransition.doorsOpenVertical(withDuration: 1.0));
            } else if playMusicLabel.contains(location) {
                MusicPlayer.musicPlayer.playMusic();

            } else if stopMusicLabel.contains(location) {
                MusicPlayer.musicPlayer.stopMusic();
            }
        }
    }
}
