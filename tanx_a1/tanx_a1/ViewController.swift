//
//  ViewController.swift
//  tanx_a1
//
//  Created by Theodore Tan on 2017-01-23.
//  Copyright © 2017 wlu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // init variables
    let questions = ["Who am I?", "Which city am I from?", "What is my GitHub?"];
    let answers = ["Theodore Tan", "Mississauga", "github.com/th30retical"];
    let images = ["images/me.jpg", "images/mississauga.jpg", "images/github.jpg"];
    let defaultLabel = "???";
    var currentQA = 0;
    var displayed = false;

    // init picture and imageview variables from display
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    func changeImage(index: Int) {
        let image = UIImage(named: images[index]);
        imageView.image = image;
    }
    
    @IBAction func showQuestion(sender: AnyObject) {
        // check if it's the first time displaying the question
        if (displayed) {
            currentQA = (currentQA + 1) % questions.count;
        } else {
            displayed = true;
        }
        
        // get question from list
        let question = questions[currentQA];
        
        // set question and answer text
        answerLabel.text = defaultLabel;
        questionLabel.text = question;
        
        // set image
        changeImage(currentQA);
    }
    
    @IBAction func showAnswer(sender: AnyObject) {
        // show answer if question is displayed
        if (displayed) {
            answerLabel.text = answers[currentQA];
        }
    }
    
    @IBAction func reset(sender: AnyObject) {
        // reset all values
        currentQA = 0;
        questionLabel.text = defaultLabel;
        answerLabel.text = defaultLabel;
        displayed = false;
        changeImage(currentQA);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // set image to ui-image
        changeImage(0);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

