//
//  InputViewController.swift
//  tanx_a3
//
//  Created by Theodore Tan on 2017-02-14.
//  Copyright © 2017 wlu. All rights reserved.
//
//  Done on the school Macs!!!!!!!!!
//

import Foundation
import UIKit

class InputViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var questionField: UITextField!
    @IBOutlet weak var answerField: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var pickerData: [String] = [String]();
    var selectedRow = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        // Connect data:
        self.pickerView.delegate = self;
        self.pickerView.dataSource = self;
        
        pickerData = Settings.images;
    }
    
    @IBAction func addCard(sender: AnyObject) {
        let question = questionField.text;
        let answer = answerField.text;
        
        if (question != "" && answer != "") {
            print("set");
            let image = pickerData[selectedRow];
            
            let deck = SharingDeck.sharedDeck.deck;
            
            deck!.addCardToDeck(image, question: question!,answer:  answer!);
        } else {
            let alert = UIAlertController(title: Settings.cardAlertTitle, message: Settings.cardAlertMessage, preferredStyle: UIAlertControllerStyle.Alert);
            
            alert.addAction(UIAlertAction(title: Settings.actionTitle, style: UIAlertActionStyle.Default, handler: nil));
            
            // show the alert
            self.presentViewController(alert, animated: true, completion: nil);
        }
    }
    
    func erase() {
        SharingDeck.sharedDeck.deck.clearDeck();
        
        let alert = UIAlertController(title: Settings.alertTitle, message: Settings.alertMessage, preferredStyle: UIAlertControllerStyle.Alert);
        
        alert.addAction(UIAlertAction(title: Settings.actionTitle, style: UIAlertActionStyle.Default, handler: nil));
        
        // show the alert
        self.presentViewController(alert, animated: true, completion: nil);
    }
    
    @IBAction func clearDeck(sender: AnyObject) {
        let test = UIAlertController(title: "", message: Settings.destroyMessage, preferredStyle: UIAlertControllerStyle.ActionSheet);
        
        let okAction = UIAlertAction(title: Settings.actionTitle, style: UIAlertActionStyle.Destructive) {
            UIAlertAction in
            self.erase()
        };
        
        test.addAction(okAction);
        test.addAction(UIAlertAction(title: Settings.actionCancel, style: UIAlertActionStyle.Cancel, handler: nil));
        
        self.presentViewController(test, animated: true, completion: nil);
    }
    
    @IBAction func backgroundTap(sender: UIControl) {
        questionField.resignFirstResponder();
        answerField.resignFirstResponder();
    }
    
    @IBAction func textFieldDoneEditing(sender: UITextField) {
        sender.resignFirstResponder();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count;
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        
        let myView = UIView(frame: CGRectMake(0, 0, pickerView.bounds.width, pickerView.bounds.height))
        
        let myImageView = UIImageView(frame: CGRectMake(0, 0, pickerView.bounds.width, pickerView.bounds.height))

        myImageView.image = UIImage(named: pickerData[row]);
        myView.addSubview(myImageView)
        
        return myView
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedRow = row;
    }
    
    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return pickerView.bounds.height - 20;
    }
    
    
    
}