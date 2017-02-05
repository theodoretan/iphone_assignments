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

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var queryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        _ = Deck();
        _ = Query();
        
//        let userDefaults = NSUserDefaults.standardUserDefaults();
////        let defaults = UserDefaults.standard;
//        if let i = userDefaults.integer(forKey: "currentIndex") as Int? {
//            print("viewDidLoad, current index is \(i)");
//            deck.setCard(i);
//        }
        
        changeImage();
    }
    
    func changeImage() {
        let image = UIImage(named: Deck.card().image);
        imageView.image = image;
    }

    @IBAction func question(sender: UIButton) {
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

