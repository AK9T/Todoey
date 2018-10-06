//
//  ViewController.swift
//  Todoey
//
//  Created by Akshay Khamankar on 10/6/18.
//  Copyright © 2018 Akshay Khamankar. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    let itemArray = ["Find Mike","Buy Eggos","Destroy Demogorgan"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      //print(itemArray[indexPath.row])
        
//        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        if( tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark)
        {
             tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        else
        {
             tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        
    }
    
//   override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//         tableView.cellForRow(at: indexPath)?.accessoryType = .none
//
//        tableView.deselectRow(at: indexPath, animated: true)
//    }

    
}
