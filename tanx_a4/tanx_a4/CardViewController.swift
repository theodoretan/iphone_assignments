//
//  CardViewController.swift
//  tanx_a4
//
//  Created by Theodore Tan on 2017-03-07.
//  Copyright © 2017 Theodore Tan. All rights reserved.
//

import UIKit

class CardViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var questionField: UITextField!
    @IBOutlet weak var answerField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    let picker = UIImagePickerController();
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        picker.delegate = self;
        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelCard(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true);
    }
    @IBAction func saveCard(_ sender: Any) {
        if (questionField.text == Settings.empty || answerField.text == Settings.empty || imageView.image == nil) {
            let alert = UIAlertController(title: Settings.cardAlertTitle, message: Settings.cardAlertMessage, preferredStyle: UIAlertControllerStyle.alert);
            
            alert.addAction(UIAlertAction(title: Settings.actionTitle, style: UIAlertActionStyle.default, handler: nil));
            
            // show the alert
            self.present(alert, animated: true, completion: nil);
        } else {
            let deck = SharingDeck.sharedDeck.deck;
            deck?.addCardToDeck(image: imageView.image!, question: questionField.text!, answer: answerField.text!);
            
            let alert = UIAlertController(title: Settings.cardAlertTitle, message: Settings.cardSaveMessage, preferredStyle: UIAlertControllerStyle.alert);
            
            alert.addAction(UIAlertAction(title: Settings.actionTitle, style: UIAlertActionStyle.default, handler: nil));
            
            // show the alert
            self.present(alert, animated: true, completion: nil);
            
        }
    }
    
    @IBAction func pickImageFromLibrary(_ sender: Any) {
        picker.allowsEditing = false;
        picker.sourceType = .photoLibrary;
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!;
        present(picker, animated: true, completion: nil);
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func backgroundTap(_ sender: UIControl) {
        questionField.resignFirstResponder();
        answerField.resignFirstResponder();
    }
    
    @IBAction func textFieldDoneEditing(sender: UITextField) {
        sender.resignFirstResponder();
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage;
        imageView.contentMode = .scaleAspectFit;
        imageView.image = image;
        dismiss(animated: true, completion: nil);
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil);
    }

}
