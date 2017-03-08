//
//  SharingDeck.swift
//  tanx_a4
//
//  Created by Theodore Tan on 2017-03-07.
//  Copyright © 2017 Theodore Tan. All rights reserved.
//

import Foundation

class SharingDeck {
    static let sharedDeck = SharingDeck();
    let filename = Settings.filename;
    private let rootkey = Settings.rootKey;
    var deck : Deck!;
    
    func dataFilePath() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true);
        let documentsDirectory = paths[0] as NSString;
        return documentsDirectory.appendingPathComponent(filename) as String;
    }
    
    func loadDeck() {
        let filepath = self.dataFilePath();
        if (FileManager.default.fileExists(atPath: filepath)) {
            let data = NSMutableData(contentsOfFile: filepath)!;
            let unarchiver = NSKeyedUnarchiver(forReadingWith: data as Data);
            deck = unarchiver.decodeObject(forKey: rootkey) as? Deck;
            unarchiver.finishDecoding();
        } else {
            deck = Deck();
        }
    }
    
    func saveDeck() {
        let filepath = self.dataFilePath();
        print("saving the data...");
        let data = NSMutableData();
        let archiver = NSKeyedArchiver(forWritingWith: data);
        archiver.encode(deck, forKey: rootkey);
        archiver.finishEncoding();
        data.write(toFile: filepath, atomically: true);
    }
    
}
