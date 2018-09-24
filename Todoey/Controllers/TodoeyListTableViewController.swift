//
//  TodoeyListTableViewController.swift
//  Todoey
//
//  Created by Duy Pham on 9/22/18.
//  Copyright © 2018 Duy Khac. All rights reserved.
//

import UIKit

class TodoeyListTableViewController: UITableViewController {

    var items = [Item]()
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()

        let newItem = Item()
        newItem.title = "Find Mike"
        items.append(newItem)
        
        //A - 1: reactivate our user defaut.
        if let itemsArray = defaults.array(forKey: "TodoListArray") as? [Item] {
            items = itemsArray
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        let item = items[indexPath.row]
        cell.textLabel?.text = item.title
        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
    }
    
    //MARK: Table View Delegate Method
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        items[indexPath.row].done = !items[indexPath.row].done
        tableView.reloadData()

    }
    
    //MARK: Add New Item

    @IBAction func addButtonPressed(_ sender: Any) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            print("Success!")

            let newItem = Item()
            newItem.title = textField.text!
            self.items.append(newItem)
            self.defaults.set(self.items, forKey: "TodoListArray")
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
