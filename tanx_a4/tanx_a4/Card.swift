//
//  Card.swift
//  tanx_a4
//
//  Created by Theodore Tan on 2017-03-07.
//  Copyright © 2017 Theodore Tan. All rights reserved.
//

import Foundation
import UIKit

class Card : NSObject, NSCoding, NSCopying {
    private var image:UIImage? = nil;
    private var question:String = "";
    private var answer:String = "";
    
    init(image:UIImage, question:String, answer:String) {
        self.image = image;
        self.question = question;
        self.answer = answer;
    }
    
    override init() {
        
    }
    
    required init?(coder decoder: NSCoder) {
        image = decoder.decodeObject(forKey: Settings.imageKey) as? UIImage;
        question = decoder.decodeObject(forKey: Settings.questionKey) as! String;
        answer = decoder.decodeObject(forKey: Settings.answerKey) as! String;
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(image, forKey: Settings.imageKey);
        coder.encode(question, forKey: Settings.questionKey);
        coder.encode(answer, forKey: Settings.answerKey);
    }
    
    func copy(with zone: NSZone?) -> Any {
        let copy = Card();
        copy.image = image;
        copy.question = question;
        copy.answer = answer;
        return copy;
    }
    
    func getQuestion() -> String {
        return question;
    }
    
    func getImage() -> UIImage {
        return image!;
    }
    
    func getAnswer() -> String {
        return answer;
    }

}
