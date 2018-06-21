//
//  ViewController.swift
//  Todoey
//
//  Created by Neil Kane on 11/06/2018.
//  Copyright © 2018 Neil Kane. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController  {
 
    var itemArray = [Item]()
     let defaults = UserDefaults.standard
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let newItem = Item()
        newItem.title = "Yana"
        itemArray.append(newItem)
        
        let newItem1 = Item()
        newItem.title = "NEil"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem.title = "NaNa"
        itemArray.append(newItem)
        
        
//        if let items = defaults.array(forKey: "TodoListArray") as? [String] {
//            itemArray = items
//        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
// MARK - Tableview Datasource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row].title
        return cell
    }
    //MARK - TableView Deligate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//     print(itemArray[indexPath.row])
    
        if itemArray[indexPath.row].done == false {
            itemArray[indexPath.row].done = true
        }else{
            itemArray[indexPath.row].done = false
        }
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
     tableView.deselectRow(at: indexPath, animated: true)
    }
    //MARK - Add New Items
    
    @IBAction func addButtomPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        let alert = UIAlertController(title: "New things", message: "", preferredStyle: .alert )
        let action = UIAlertAction(title: "Add items", style: .default) { (action) in
    //what happen once the user clicks the ADD Item
            let newItem = Item()
            newItem.title = textField.text!
        self.itemArray.append(newItem)
            
            self.defaults.set( self.itemArray, forKey: "TodoListArray")
            self.tableView.reloadData()
    
    }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
           textField = alertTextField
        }
           alert.addAction(action)
        present(alert, animated: true, completion: nil)
}
}

