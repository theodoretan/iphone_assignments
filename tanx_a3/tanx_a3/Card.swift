//
//  Card.swift
//  tanx_a3
//
//  Created by Theodore Tan on 2017-02-14.
//  Copyright © 2017 wlu. All rights reserved.
//

import Foundation

class Card : NSObject, NSCoding, NSCopying {
    private var image:String = "";
    private var question:String = "";
    private var answer:String = "";
    
    init(i: String, q: String, a: String) {
        self.image = i;
        self.question = q;
        self.answer = a;
    }
    
    override init() {
        
    }
    
    required init?(coder decoder: NSCoder) {
        image = decoder.decodeObjectForKey(Settings.imageKey) as! String;
        question = decoder.decodeObjectForKey(Settings.questionKey) as! String;
        answer = decoder.decodeObjectForKey(Settings.answerKey) as! String;
    }
    
    func encodeWithCoder(coder: NSCoder) {
        coder.encodeObject(image, forKey: Settings.imageKey);
        coder.encodeObject(question, forKey: Settings.questionKey);
        coder.encodeObject(answer, forKey: Settings.answerKey);
    }
    
    func copyWithZone(zone: NSZone) -> AnyObject {
        let copy = Card();
        copy.image = image;
        copy.question = question;
        copy.answer = answer;
        return copy;
    }
    
    func getQuestion() -> String {
        return question;
    }
    
    func getImage() -> String {
        return image;
    }
    
    func getAnswer() -> String {
        return answer;
    }
}