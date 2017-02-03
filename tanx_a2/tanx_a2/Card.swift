//
//  Card.swift
//  tanx_a2
//
//  Created by Theodore Tan on 2017-02-03.
//  Copyright © 2017 wlu. All rights reserved.

import Foundation

struct Card {
    let image:String;
    let question:String;
    let answer:String;
}

struct Deck {
    static var deck = [Card](); // a deck is an array of cards
    static var current:Int = 0; // the current card on the deck
    
    init() {
        let questions = ["Who am I?", "Which city am I from?", "What is my GitHub?"];
        let answers = ["Theodore Tan", "Mississauga", "github.com/th30retical"];
        
        for (var i = 0; i < questions.count; i+=1) {
            let card = Card(image: "", question: questions[i], answer: answers[i]);
            Deck.deck.append(card);
        }
    }
    
    static func card() -> Card {
        return deck[current];
    }
    
    static func setCard(index: Int) {
        current = index;
    }
    
    static func getCard() -> Int {
        return current;
    }
}
