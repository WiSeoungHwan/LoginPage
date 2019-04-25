//
//  TextViewTableViewCell.swift
//  LoginPage
//
//  Created by Wi on 19/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

class TextViewTableViewCell: UITableViewCell {
    
    var textView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    func configure(){
        contentView.addSubview(textView)
        textView.text = "터치해 재료를 입력해주세요"
        textView.font = UIFont.systemFont(ofSize: 15)
        autolayout()
    }
    
    func autolayout(){
        textView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        textView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        textView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        textView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        textView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
