//
//  DeckViewController.swift
//  tanx_a4
//
//  Created by Theodore Tan on 2017-03-07.
//  Copyright © 2017 Theodore Tan. All rights reserved.
//

import Foundation
import UIKit

class DeckViewController: UITableViewController {
    
    let cellIdentifier = Settings.cellID;
    let segueIdentifierShow = Settings.segueIDShow;
    let segueIdAdd = Settings.segueIDAdd;
    
    var deck : Deck!;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        _ = SharingDeck();
        SharingDeck.sharedDeck.loadDeck();
        
        deck = SharingDeck.sharedDeck.deck;
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // show updated table
        tableView.reloadData();
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return deck.getDeckSize();
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath);
        
        let card = deck.getCard(index: indexPath.row);
        cell.imageView?.image = card.getImage();
        cell.textLabel?.text = card.getQuestion();
        
        return cell;
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deck.removeCard(index: indexPath.row);
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == segueIdentifierShow) {
            let indexPath = tableView.indexPath(for: sender as! UITableViewCell);
            let detailVC = segue.destination as! DetailViewController;
            
            let card = deck.getCard(index: (indexPath?.row)!);
            
            detailVC.initWithData(data: card);
            
        }
    }
    
    
    
}
