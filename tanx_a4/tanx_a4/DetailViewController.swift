//
//  DetailViewCellViewController.swift
//  tanx_a4
//
//  Created by Theodore Tan on 2017-03-07.
//  Copyright © 2017 Theodore Tan. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var answerField: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var card:Card?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set view
        answerField.text = card!.getAnswer();
        self.title = card?.getQuestion();
        imageView.image = card?.getImage();

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func initWithData(data: Card) {
        // load card
        self.card = data;
    }
}
