//
//  ViewController.swift
//  tanx_a2
//
//  Created by Theodore Tan on 2017-02-03.
//  Copyright © 2017 wlu. All rights reserved.
//
//  IMPORTANT: Developed on the school Macs!!!!
//

import Foundation
import UIKit

class ViewController: UIViewController {

    // get variables from storyboard
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var queryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // initiate deck and query
        _ = Deck();
        _ = Query();
        
        // if the user has used the app before, get where they left off
        let defaults = NSUserDefaults.standardUserDefaults();
        if let i = defaults.integerForKey("currentIndex") as Int? {
            print("viewDidLoad, current index is \(i)");
            Deck.setCard(i);
        }
        
        // if the user has used the app before, get the number of times
        // they pressed show answer
        if let j = defaults.integerForKey("query") as Int? {
            Query.setCount(j);
            queryLabel.text = String(j);
            if (j != 0) {
                questionLabel.text = Deck.card().question;
            }
        }
        
        // change the image programatically
        changeImage();
    }
    
    func changeImage() {
        // gets the current image and sets it in the image view
        let image = UIImage(named: Deck.card().image);
        imageView.image = image;
    }

    @IBAction func question(sender: UIButton) {
        // displays the next question and removes the old answer
        if (questionLabel.text != "???") {
            let currentQA = (Deck.getCard() + 1) % Deck.length();
            Deck.setCard(currentQA);
        }
        
        let question = Deck.card().question;
        answerLabel.text = "???";
        questionLabel.text = question;
        changeImage();
    }
    
    @IBAction func answer(sender: UIButton) {
        // only show the answer if there's a question
        // and add one to the query count if they pressed it to show the answer
        if (questionLabel.text != "???" && answerLabel.text == "???") {
            let answer = Deck.card().answer;
            answerLabel.text = answer;
            let count = Query.getCount();
            Query.setCount(count+1);
            queryLabel.text = String(count+1);
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

