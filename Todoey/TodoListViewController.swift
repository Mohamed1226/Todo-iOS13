//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
var item = ["dola","mohamed","ahmed","abdo"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    //MARK: - create cell

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = item[indexPath.row]
        
        return cell
    }
    
    //MARK: - when cell pressed

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if  tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }

        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - add item
    @IBAction func onAddItemPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add",style: .default) { UIAlertAction in
            if let safeText = textField.text {
                self.item.append(safeText)
                self.tableView.reloadData()
                print(safeText)
            }
        }
        alert.addTextField(configurationHandler: {textFiled in
            textField = textFiled
            textFiled.placeholder = "Please add new item"
                           } )
        alert.addAction(action)
        present(alert, animated: true)
    }
}

