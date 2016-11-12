//
//  MessagesViewController.swift
//  SlapChat
//
//  Created by Douglas Galante on 11/10/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class RecipientTableViewController: UITableViewController {
    
    let store = DataStore.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        store.fetchData()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return store.recipients.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recipientCell")
        
        cell?.textLabel?.text = store.recipients[indexPath.row].name
        
        return cell!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMessages" {
            let destVC = segue.destination as! TableViewController
            let index = tableView.indexPathForSelectedRow?.row
            
            if let index = index {
                let recipient = store.recipients[index]
                if let messages = recipient.messages?.allObjects {
                    store.messages = messages as! [Message]
                    destVC.recipient = recipient
                }
            }
        }
    }
}
