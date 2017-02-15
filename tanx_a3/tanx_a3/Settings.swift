//
//  Settings.swift
//  tanx_a3
//
//  Created by Theodore Tan on 2017-02-14.
//  Copyright © 2017 wlu. All rights reserved.
//

import Foundation

class Settings {
    static let filename = "cards.archive";
    static let rootKey = "rootKey";
    static let imageKey = "imageKey";
    static let questionKey = "questionKey";
    static let answerKey = "answerKey";
    static let deckKey = "deckKey";
    static let indexKey = "indexKey";
    
    static let images = ["mississauga", "raptors", "bluejays", "leafs", "coffee", "flash"];
    
    static let defaultPicture = "defaultimage";
    static let defaultQuestion = "Please add a question using the Input Tab";
    static let defaultAnswer = "???";

    static let alertTitle = "Clear Deck";
    static let alertMessage = "The deck was erased";
    static let actionTitle = "OK";
    
    static let cardAlertTitle = "Information";
    static let cardAlertMessage = "Please fill out all the fields";
    
    static let actionCancel = "Cancel";
    static let destroyMessage = "The entire deck will be erased, are you sure?";
}