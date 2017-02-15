//
//  Deck.swift
//  tanx_a3
//
//  Created by Theodore Tan on 2017-02-14.
//  Copyright © 2017 wlu. All rights reserved.
//

import Foundation

class Deck : NSObject, NSCoding, NSCopying {
    private let defaultCard = Card(i: Settings.defaultPicture, q: Settings.defaultQuestion, a: Settings.defaultAnswer);
    var deck = [Card]();
    var current:Int = 0;
    
    override init() {
        
    }
    
    required init?(coder decoder: NSCoder) {
        deck = (decoder.decodeObjectForKey(Settings.deckKey) as? [Card])!;
        current = decoder.decodeIntegerForKey(Settings.indexKey);
    }
    
    func encodeWithCoder(coder: NSCoder) {
        coder.encodeObject(deck, forKey: Settings.deckKey);
        coder.encodeInteger(current, forKey: Settings.indexKey);
    }
    
    func copyWithZone(zone: NSZone) -> AnyObject {
        let copy = Deck();
        copy.deck = deck;
        copy.current = current;
        return copy;
    }
    
    // other functions
    func getCurrentCard() -> Card {
        var card = defaultCard;
        if (deck.count != 0) {
            card = deck[current];
        }
        return card;
    }
    
    
    func getNextCard() -> Card {
        var card = defaultCard;
        if (deck.count != 0) {
            current = (current + 1) % deck.count;
            card = deck[current];
        }
        return card;
        
    }
    
    func setCurrentIndex(index: Int) {
        current = index;
    }
    
    func getCurrentIndex() -> Int {
        return current;
    }
    
    func addCardToDeck(image: String, question: String, answer: String) {
        let card = Card(i: image, q: question, a: answer);
        deck.append(card);
    }
    
    func getDeckSize() -> Int {
        return deck.count;
    }
    
    func clearDeck() {
        deck.removeAll();
        current = 0;
    }
}