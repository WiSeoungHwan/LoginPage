//
//  AddMyRecipeTableViewController.swift
//  LoginPage
//
//  Created by Wi on 19/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

class AddMyRecipeTableViewController: UITableViewController {
    var nutritionNames = [
        "열량(kcal)",
        "탄수화물(g)",
        "식이섬유(g)",
        "동물성 단백질(g)",
        "식물성 단백질(g)",
        "동물성 지방(g)",
        "식물성 지방(g)",
        "콜레스테롤(g)",
        "나트륨(mg)",
        "칼륨(mg)",
        "인(mg)",
        "동물성 칼슘(mg)",
        "식물성 칼슘(mg)",
        "동물성 철분(mg)",
        "식물성 철분(mg)"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonDidTap))
        self.title = "나만의 식단만들기"
//        self.tableView.separatorColor = .clear
        
        self.tableView.register(UINib(nibName: "AddMyRecipeTableViewCell", bundle: nil), forCellReuseIdentifier: "menu")
        self.tableView.register(TextViewTableViewCell.self, forCellReuseIdentifier: "textView")
        self.tableView.register(NutritionTableViewCell.self, forCellReuseIdentifier: "nutrition")
    }
    
    
    
    // MARK: Action
    
    @objc private func saveButtonDidTap(_ sender: UIBarButtonItem){
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 4
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 3 {
            return nutritionNames.count
        }
        return 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        switch indexPath.section {
        case 0:
            cell = tableView.dequeueReusableCell(withIdentifier: "menu", for: indexPath)
        case 1, 2:
            cell = tableView.dequeueReusableCell(withIdentifier: "textView", for: indexPath)
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "nutrition", for: indexPath) as! NutritionTableViewCell
            cell.label.text = nutritionNames[indexPath.row]
            cell.selectionStyle = .none
            return cell
        }
        cell.selectionStyle = .none
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "나만의 식단"
        case 1:
            return "재료"
        case 2:
            return "레시피"
        case 3:
            return "영양분석"
        default:
            return "dd"
        }
    }

}
