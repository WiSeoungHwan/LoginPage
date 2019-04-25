//
//  MyRecipeTableViewCell.swift
//  LoginPage
//
//  Created by Wi on 18/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

class MyRecipeTableViewCell: UITableViewCell {
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var recipeNameLabel: UILabel!
    @IBOutlet weak var kLabel: UILabel!
    @IBOutlet weak var baseView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.contentView.layer.cornerRadius = 5
        recipeImageView.image = UIImage(named: "backgroundImage1")
        baseView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.95).isActive = true
        baseView.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.95).isActive = true
        baseView.layer.cornerRadius = 5
        baseView.layer.shadowColor = UIColor.black.cgColor
        baseView.layer.shadowOffset = CGSize(width: 5, height: 5)
        baseView.layer.shadowRadius = 10
        baseView.layer.shadowOpacity = 0.2
        baseView.layer.shadowPath = UIBezierPath(rect: CGRect(x: 20, y: 0, width: baseView.bounds.width + 10, height: baseView.bounds.height)).cgPath
//        baseView.layer.shouldRasterize = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        
        
    }
    
}
