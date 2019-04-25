//
//  MyRecipeTableViewController.swift
//  LoginPage
//
//  Created by Wi on 18/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

class MyRecipeViewController: UITableViewController {
    
    // MARK: - Properties
    
    var array = ["",""]
    
    // MARK: - Methods
    
    // MARK: lif cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: "MyRecipeTableViewCell", bundle: nil ), forCellReuseIdentifier: "MyRecipe")
        self.tableView.separatorColor = .clear
        self.title = "나만의 식단"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonDidTap))
    }
    
    // MARK: Action
    
    @objc private func addButtonDidTap(_ sender: UIBarButtonItem){
        show(AddMyRecipeTableViewController(), sender: nil)
    }
    
    
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            array.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            // delete item at indexPath
            self.array.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        return [delete]
    }
    

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return array.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyRecipe", for: indexPath)
        return cell
    }

}
