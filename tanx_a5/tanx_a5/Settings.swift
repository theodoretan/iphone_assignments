//
//  Settings.swift
//  tanx_a5
//
//  Created by Theodore Tan on 2017-03-20.
//  Copyright © 2017 Theodore Tan. All rights reserved.
//

import Foundation

class Settings {
    static let game = "GameScene";
    
    static let INVADER_SPEED = 3.5;
    static let BULLET_SPEED = 1.0;
    static let KILLED_TO_WIN = 3;
    static let INTERVAL = 3.5;
    static let EOG = 0;
    static let BOS = 0;
    
    
    // Music
    static let backgroundMusic = "Sound Effects/spaceinvaders1.mpeg";
    static let boom = "Sound Effects/explosion.mp3";
    static let pew = "Sound Effects/bullet-fire.mp3";
    
    // Font
    static let font = "Helvetica";
    static let endFontSize = 50;
    static let bigFont = 60;
    static let smallFont = 40;
    
    // Image
    static let player = "Spaceship";
    static let enemy = "ufo";
    static let bullet = "bullet";
    static let fire = "fire";
    static let left = "leftarrow";
    static let right = "rightarrow";
    static let explosion = "explosion";
    
    // Labels
    static let gameOver = "GAME OVER";
    static let win = "YOU WIN";
    static let instructions = "Kill 3 invaders before 3 hit the ground!";
    static let backButton = "Back";
    
    static let playLabel = "Play";
    static let instructionsLabel = "Instruction";
    static let pMusicLabel = "Play Music";
    static let sMusicLabel = "Stop Music";
    
    // Transition
    static let transition = 1.0;
    static let waitTime = 2.0;
    static let waitTime2 = 0.5;
    
    // Game
    static let playerName = "player";
    static let enemyName = "enemy";
    static let bulletName = "bullet";
    
    static let scale = 0.5;
    static let move = 30;
    
    static let rDirection = "right";
    static let lDirection = "left";
    
    
}
