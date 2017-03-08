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
    
    var data = "";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answerField.text = self.data;

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    func initWithData(data: String) {
        self.data = data;
    }
}
