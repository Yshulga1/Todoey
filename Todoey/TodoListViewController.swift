//
//  ViewController.swift
//  Todoey
//
//  Created by Neil Kane on 11/06/2018.
//  Copyright © 2018 Neil Kane. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController  {
 
    var itemArray = ["Neilushka-Milushka", "Yana-Banana", "Panda"]
    override func viewDidLoad() {
        super.viewDidLoad()
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
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    //MARK - TableView Deligate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//     print(itemArray[indexPath.row])
    
        
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
        self.itemArray.append(textField.text!)
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

