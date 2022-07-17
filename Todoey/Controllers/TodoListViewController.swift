//
//  ViewController.swift
//  Todoey
//
//  Created by Akshay Khamankar on 10/6/18.
//  Copyright © 2018 Akshay Khamankar. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = [Item]()
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
      print(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true))
        
        let newItem = Item()
        newItem.title = "Find Mike"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Buy Eggos"
        itemArray.append(newItem2)

        
        
        let newItem3 = Item()
        newItem3.title = "Destroy Demogorgon"
        itemArray.append(newItem3)

        
        
        debugPrint("mew")
        
        if let items = defaults.array(forKey: "TodoListArray") as? [Item]
       {
         itemArray = items
        }
        
     
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        
        //Ternary operator
        cell.accessoryType = item.done == true ? .checkmark : .none
        

        
      
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      //print(itemArray[indexPath.row])
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
       
    
//        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
        
    
    }
    

    
    @IBAction func addBtnPressed(_ sender: UIBarButtonItem) {
        
        
        var textField = UITextField()
        
        
        let alert = UIAlertController(title: "Add New Todey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //what happesn when the user clicks on ADD(+) button
            
            let newItem = Item()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
            
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            
            print("Success!")
            
            self.tableView.reloadData()
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new Item"
            textField = alertTextField
            
            
        }
        alert.addAction(action)
    present(alert,animated: true,completion: nil)
    }
    
    
    
    
    
}

