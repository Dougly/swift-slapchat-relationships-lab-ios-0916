//
//  AddRecipientViewController.swift
//  SlapChat
//
//  Created by Douglas Galante on 11/11/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit
import CoreData

class AddRecipientViewControler: UIViewController {
    
    var store = DataStore.sharedInstance
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveRecipientClicked(_ sender: UIButton) {
        let newRecipient = textField.text
        
        if let newRecipient = newRecipient {
            let context = store.persistentContainer.viewContext
            let entity = Recipient(context: context)
            
            entity.name = newRecipient
            entity.email = "\(newRecipient)@gmail.com"
            entity.phoneNumber = "(555)555-5555"
            entity.twitterHandle = "@\(newRecipient)ly"
            
            store.saveContext()
            store.recipients.append(entity)
        }
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func cancelClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
}

