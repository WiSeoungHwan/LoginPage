//
//  SignUpViewController.swift
//  LoginPage
//
//  Created by Wi on 11/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    // MARK: - Properties
    
    var backgroundImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "backgroundImage2"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = UIView.ContentMode.scaleAspectFill
        return imageView
    }()
    
    var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var nameTextField: UITextField  {
        let textField = createTextField("Name", UIImage(named: "user")!)
        return textField
    }

    var idTextField: UITextField {
        let textField = createTextField("Id", UIImage(named: "user")!)
        return textField
    }
    
    var pwTextField: UITextField {
        let textField = createTextField("Password", UIImage(named: "lock")!)
        return textField
    }
    
    var phoneNumTextField: UITextField {
        let textField = createTextField("PhoneNumber", UIImage(named: "phone")!)
        return textField 
    }
    
    
    // MARK: - Methods
    
    // MARK: lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    
    // MARK: other Func
    
    func configure(){
        
        // stackView
        
        stackView.addArrangedSubview(nameTextField)
        stackView.addArrangedSubview(idTextField)
        stackView.addArrangedSubview(pwTextField)
        stackView.addArrangedSubview(phoneNumTextField)
        stackView.axis = .vertical
        stackView.backgroundColor = UIColor.darkGray.withAlphaComponent(0.5)
        stackView.distribution = .equalSpacing
        
        // addSubView
        view.addSubview(backgroundImageView)
        view.addSubview(stackView)
        
        // UI
        animateImageView()
        autoLayout()
        
        
        
    }
    
    func createTextField(_ placeholder: String, _ leftViewImage: UIImage) -> UITextField {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.orange.withAlphaComponent(0.9)
        textField.textColor = .white
        textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.5)])
        textField.leftView = UIImageView(image: leftViewImage)
        textField.leftView?.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        textField.layer.cornerRadius = 10
        textField.leftViewMode = .always
        let height = textField.heightAnchor.constraint(equalToConstant: 50)
        height.isActive = true
        height.priority = UILayoutPriority(rawValue: 999)

        return textField
    }
    
    // MARK: UI
    func animateImageView(){
        UIView.animateKeyframes(withDuration: 5, delay: 0, options: [.autoreverse, .repeat], animations: {
            self.backgroundImageView.center.x += 50
        })
    }
    
    func autoLayout(){
        let guide = self.view.safeAreaLayoutGuide
        
        // backgroundImageView
        
        self.backgroundImageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.backgroundImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 50).isActive = true
        self.backgroundImageView.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        self.backgroundImageView.heightAnchor.constraint(equalToConstant: self.view.frame.height).isActive = true
        
        self.stackView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20).isActive = true
        self.stackView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20).isActive = true
        self.stackView.topAnchor.constraint(equalTo: guide.topAnchor, constant: 150).isActive = true
        self.stackView.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -250).isActive = true
    }

}

