//
//  Deck.swift
//  tanx_a4
//
//  Created by Theodore Tan on 2017-03-07.
//  Copyright © 2017 Theodore Tan. All rights reserved.
//

import Foundation
import UIKit

class Deck : NSObject, NSCoding, NSCopying {
    private var deck = [Card]();
    private var current:Int = 0;
    
    override init() {
        
    }
    
    required init?(coder decoder: NSCoder) {
        deck = (decoder.decodeObject(forKey: Settings.deckKey) as? [Card])!;
        current = decoder.decodeInteger(forKey: Settings.indexKey);
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(deck, forKey: Settings.deckKey);
        coder.encode(current, forKey: Settings.indexKey);
    }
    
    func copy(with zone: NSZone?) -> Any {
        let copy = Deck();
        copy.deck = deck;
        copy.current = current;
        return copy;
    }
    
    // other functions
    func getCurrentCard() -> Card {
        let card = deck[current];
        return card;
    }
    
    
    func getNextCard() -> Card? {
        if (deck.count != 0) {
            current = (current + 1) % deck.count;
            let card = deck[current];
            return card;
        }
        return nil;
    }
    
    
    func getCard(index: Int) -> Card {
        let card = deck[index];
        return card;
    }
    
    
    func setCurrentIndex(index: Int) {
        if (index < deck.count) {
            current = index;
        } else {
            current = 0;
        }
    }
    
    func getCurrentIndex() -> Int {
        return current;
    }
    
    func addCardToDeck(image: UIImage, question: String, answer: String) {
        let card = Card(image: image, question: question, answer: answer);
        deck.append(card);
    }
    
    func getDeckSize() -> Int {
        return deck.count;
    }
    
    func clearDeck() {
        deck.removeAll();
        current = 0;
    }
    
    
    func removeCard(index: Int) {
        deck.remove(at: index);
    }
    
}
