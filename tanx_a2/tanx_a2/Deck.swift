//
//  Deck.swift
//  tanx_a2
//
//  Created by Theodore Tan on 2017-02-05.
//  Copyright © 2017 wlu. All rights reserved.
//

import Foundation

struct Deck {
    private static var deck = [Card](); // a deck is an array of cards
    private static var current:Int = 0; // the current card on the deck
    
    init() {
        // create the deck of cards
        let questions = ["Who am I?", "Which city am I from?", "What is my GitHub?"];
        let answers = ["Theodore Tan", "Mississauga", "github.com/th30retical"];
        let images = ["me.png", "mississauga.png", "github.png"];
        for (var i = 0; i < questions.count; i+=1) {
            let card = Card(image: images[i], question: questions[i], answer: answers[i]);
            Deck.deck.append(card);
        }
    }
    
    // gets the card from the deck
    static func card() -> Card {
        return deck[current];
    }

    // sets the new index of the deck
    static func setCard(index: Int) {
        current = index;
    }
    
    // gets the current index of the deck
    static func getCard() -> Int {
        return current;
    }
    
    // gets the length of the deck
    static func length() -> Int {
        return deck.count;
    }
}
