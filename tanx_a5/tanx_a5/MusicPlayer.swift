//
//  MusicPlayer.swift
//  tanx_a5
//
//  Created by Theodore Tan on 2017-03-20.
//  Copyright © 2017 Theodore Tan. All rights reserved.
//

import Foundation
import AVFoundation

class MusicPlayer {
    static var musicPlayer = MusicPlayer();
    private var backgroundMusic: AVAudioPlayer!;
    private var playingMusic = false;
    
    init() {
        startup();
    }
    
    private func startup() {
        let path = Bundle.main.path(forResource: Settings.backgroundMusic, ofType: nil);
        
        let url = URL(fileURLWithPath: path!);
        
        do {
            let sound = try AVAudioPlayer(contentsOf: url);
            
            backgroundMusic = sound;
            backgroundMusic.numberOfLoops = -1;
            backgroundMusic.play();
            playingMusic = true;
        } catch {
            // print couldnt load file
        }
    }
    
    func playMusic() {
        if (!playingMusic) {
            startup();
        }
    }
    
    func stopMusic() {
        if backgroundMusic != nil {
            backgroundMusic.stop();
            playingMusic = false;
            backgroundMusic = nil;
        }
    }
    
    func isPlaying() -> Bool {
        return playingMusic;
    }
}
