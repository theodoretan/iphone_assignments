//
//  CardViewController.swift
//  tanx_a3
//
//  Created by Theodore Tan on 2017-02-14.
//  Copyright © 2017 wlu. All rights reserved.
//  
//  Done on the school Macs!!!!!!!
//

import Foundation
import UIKit

class CardViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var answerText: UILabel!
    @IBOutlet weak var cardLabel: UILabel!
    
    var deck : Deck!;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        _ = SharingDeck();
        SharingDeck.sharedDeck.loadDeck();
        
        deck = SharingDeck.sharedDeck.deck;
        let card = deck.getCurrentCard();
        
        
        imageView.image = UIImage(named: card.getImage());
        questionText.text = card.getQuestion();

        cardLabel.text = String(Int(deck.getDeckSize()));
    }
    
    override func viewWillAppear(animated: Bool) {
        _ = SharingDeck();
        
        deck = SharingDeck.sharedDeck.deck;
        
        let card = deck.getCurrentCard();
            
        answerText.text = Settings.defaultAnswer;
        imageView.image = UIImage(named: (card.getImage()));
        questionText.text = (card.getQuestion());
        cardLabel.text = String(Int(deck.getDeckSize()));
        
    }
    
    @IBAction func showQuestion(sender: AnyObject) {
        let card = deck.getNextCard();
        
        answerText.text = Settings.defaultAnswer;
        imageView.image = UIImage(named: (card.getImage()));
        questionText.text = (card.getQuestion());
    }
    
    @IBAction func showAnswer(sender: AnyObject) {
        let card = deck.getCurrentCard();
        answerText.text = (card.getAnswer());
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }
}
