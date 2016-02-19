//
//  ViewController.swift
//  RealmSampleSwift
//
//  Created by ME-Tech MacPro User 2 on 2/18/16.
//  Copyright © 2016 iTrain Asia. All rights reserved.
//

import UIKit
import Realm

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var tableView: UITableView!
    
    var todos: RLMResults {
        get {
            return ToDoItem.allObjects()
        }
    }
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "CellIdentifier")
        // Do any additional setup after loading the view, typically from a nib.
    }

   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addButtonPressed(sender: AnyObject) {
        
        let alertController = UIAlertController(title: "Add new Item", message: "Please add new Item", preferredStyle: .Alert)
        alertController.addTextFieldWithConfigurationHandler { (textField) in
            textField.placeholder = "Enter your name"
        }
        alertController.addTextFieldWithConfigurationHandler { (textField) in
            textField.placeholder = "Enter the description"
        }
        let okBtn = UIAlertAction(title: "OK", style: .Default) { (alert: UIAlertAction)  in
            let realm = RLMRealm.defaultRealm()
         
                let newTodoItem = ToDoItem()
                newTodoItem.name = (alertController.textFields?.first?.text!)!
            newTodoItem.itemDescription = (alertController.textFields?.last?.text!)!
            do {
               try realm.transactionWithBlock(){ 
                    realm.addObject(newTodoItem)
                
                }
            }
            catch {
                
            }
            self.tableView.reloadData()
        }
        alertController.addAction(okBtn)
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
        let todoItem = todos.objectAtIndex(UInt(indexPath.row)) as! ToDoItem
        cell.textLabel!.text = todoItem.name
        cell.detailTextLabel!.text = todoItem.itemDescription
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Int(todos.count)
    }

}

