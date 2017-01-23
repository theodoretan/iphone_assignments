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
    let questions = ["Who is this?", "Which city is this place from?", "What brand is this?"];
    let answers = ["Steve Jobs", "Toronto", "Apple"];
    let images = ["steve-jobs.jpg", "toronto.jpg", "apple.png"];
    let defaultLabel = "???";
    var currentQA = 0;
    var displayed = false;

    // init picture and imageview variables from display
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func showQuestion(sender: AnyObject) {
        // check if it's the first time displaying the question
        if (displayed) {
            currentQA = (currentQA + 1) % 3;
        } else {
            displayed = true;
        }
        
        // get question from list
        let question = questions[currentQA];
        
        // set question and answer text
        answerLabel.text = defaultLabel;
        questionLabel.text = question;
        
        // set image
        let image = UIImage(named: "images/" + images[currentQA]);
        imageView.image = image;
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
        let image = UIImage(named: "images/" + images[currentQA]);
        imageView.image = image;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // set image to ui-image
        let image = UIImage(named: "images/" + images[0]);
        imageView.image = image;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

