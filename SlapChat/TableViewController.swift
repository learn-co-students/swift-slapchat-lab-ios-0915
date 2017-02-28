//
//  TableViewController.swift
//  SlapChat
//
//  Created by Ian Rahman on 7/16/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit
import CoreData


class TableViewController: UITableViewController {

    let store: DataStore = DataStore.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("hi!")
        
        store.fetchData()
        //self.generateTestData()
        print("messages: \(store.messages)")
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    
    func generateTestData() {
    
        let managedObjectContext = store.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Message", in: managedObjectContext)
        
        let message1 = NSManagedObject(entity: entity!, insertInto: managedObjectContext)
        message1.setValue("Hello from the outside", forKeyPath: "content")
        let date = NSDate()
        message1.setValue(date, forKeyPath: "createdAt")
        
        let message2 = NSManagedObject(entity: entity!, insertInto: managedObjectContext)
        message2.setValue("Are you there?", forKeyPath: "content")
        let date2 = NSDate()
        message2.setValue(date2, forKeyPath: "createdAt")
        
        store.saveContext()
        store.fetchData()
    }
    
}


