//
//  Settings.swift
//  tanx_a4
//
//  Created by Theodore Tan on 2017-03-07.
//  Copyright © 2017 Theodore Tan. All rights reserved.
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
    
    
    static let alertTitle = "Clear Deck";
    static let alertMessage = "The deck was erased";
    static let actionTitle = "OK";
    
    static let cardAlertTitle = "Information";
    static let cardAlertMessage = "Please fill out all the fields";
    static let cardSaveMessage = "Saved Card";
    
    static let actionCancel = "Cancel";
    static let destroyMessage = "The entire deck will be erased, are you sure?";
    
    static let cellID = "cell";
    static let segueIDShow = "ShowDetail";
    static let segueIDAdd = "AddCard";
    
    static let empty = "";
}
