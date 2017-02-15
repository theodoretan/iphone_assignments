//
//  SharingDeck.swift
//  tanx_a3
//
//  Created by Theodore Tan on 2017-02-14.
//  Copyright © 2017 wlu. All rights reserved.
//

import Foundation

class SharingDeck {
    static let sharedDeck = SharingDeck();
    let filename = Settings.filename;
    private let rootkey = Settings.rootKey;
    var deck : Deck!;
    
    func dataFilePath() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true);
        let documentsDirectory = paths[0] as NSString;
        return documentsDirectory.stringByAppendingPathComponent(filename) as String;
    }
    
    func loadDeck() {
        let filepath = self.dataFilePath();
        if (NSFileManager.defaultManager().fileExistsAtPath(filepath)) {
            let data = NSMutableData(contentsOfFile: filepath)!;
            let unarchiver = NSKeyedUnarchiver(forReadingWithData: data);
            deck = unarchiver.decodeObjectForKey(rootkey) as? Deck;
            unarchiver.finishDecoding();
        } else {
            deck = Deck();
        }
    }
    
    func saveDeck() {
        let filepath = self.dataFilePath();
        print("saving the data...");
        let data = NSMutableData();
        let archiver = NSKeyedArchiver(forWritingWithMutableData: data);
        archiver.encodeObject(deck, forKey: rootkey);
        archiver.finishEncoding();
        data.writeToFile(filepath, atomically: true);
    }
    
}