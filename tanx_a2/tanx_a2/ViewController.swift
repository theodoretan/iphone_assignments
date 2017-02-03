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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var deck = Deck();
        let userDefaults = NSUserDefaults.standardUserDefaults();
        if let i = userDefaults.integer(forKey: "currentIndex") as Int? {
            print("viewDidLoad, current index is \(i)");
            deck.setCard(i);
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

