//
//  AddMyRecipeTableViewCell.swift
//  LoginPage
//
//  Created by Wi on 19/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

class AddMyRecipeTableViewCell: UITableViewCell {
    @IBOutlet weak var foodNameTextField: UITextField!
    @IBOutlet weak var foodImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        foodImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageViewDidTap)))
        
        self.foodImageView.image = UIImage(named: "backroundImage1")
    }
    
    // MARK: Action
    
    @objc private func imageViewDidTap(){
        // 카메라 혹은 앨범에서 이미지 가져오기
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
