//
//  TextFieldView.swift
//  LoginPage
//
//  Created by Wi on 25/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit


class TextFieldView: UIView {
    var leftViewImageName: String?
    var placeholder: String?
    
    let textField: InsetTextField = {
        let textField = InsetTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = .black
        textField.leftViewMode = .always
        textField.borderStyle = .none
        return textField
    }()
    
    let underLine: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        view.backgroundColor = .gray
        return view
    }()
    
    let underLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    func configure(){
        
        autoLayout()
    }
    
    func autoLayout(){
        
        self.addSubview(textField)
        self.addSubview(underLine)
        self.addSubview(underLabel)
        
        textField.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        textField.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        textField.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        
        underLine.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        underLine.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        underLine.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        underLine.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 10).isActive = true
        
        underLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        underLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        underLabel.topAnchor.constraint(equalTo: underLine.bottomAnchor, constant: 10).isActive = true
        
    }
    
}
