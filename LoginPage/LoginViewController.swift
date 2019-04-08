//
//  LoginViewController.swift
//  LoginPage
//
//  Created by Wi on 07/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate{
    
    // MARK: - Propertes
    
    var backgroundImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "backgroundImage1"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = UIView.ContentMode.scaleAspectFill
        return imageView
    }()
    
    var exitButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "exit"), for: .normal)
        button.addTarget(self, action: #selector(exitButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    var idTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.lightGray.withAlphaComponent(0.8)
        textField.textColor = .white
        textField.placeholder = " Id"
        textField.leftView = UIImageView(image: UIImage(named: "user"))
        textField.leftView?.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        textField.leftViewMode = .always
        return textField
    }()
    var pwTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.lightGray.withAlphaComponent(0.8)
        textField.textColor = .white
        textField.placeholder = " Password"
        textField.leftView = UIImageView(image: UIImage(named: "lock"))
        textField.leftView?.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        textField.leftViewMode = .always
        return textField
    }()
    
    var loginButton: UIButton = {
        let button: UIButton = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        button.backgroundColor = UIColor.orange
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    
    // MARK: - Method
    
    // MARK: life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    // MARK: other func
    private func configure(){
        
        // delegate
        self.idTextField.delegate = self
        self.pwTextField.delegate = self
        
        // addSubview
        self.view.addSubview(backgroundImageView)
        self.view.addSubview(exitButton)
        self.view.addSubview(idTextField)
        self.view.addSubview(pwTextField)
        self.view.addSubview(loginButton)
        
        // UI
        animateImageView()
        keyboardSetting()
        // autoLayout
        
        autoLayout()
    }
    
    
    // MARK: Action
    
    @objc private func exitButtonDidTap(_ sender: UIButton){
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func loginButtonDidTap(_ sender: UIButton){
        print("loginButton")
    }
    
    @objc private func keyboardWillHide(_ sender: Notification){
        self.view.frame.origin.y = 0
    }
    @objc private func keyboardWillShow(_ sender: Notification){
        self.view.frame.origin.y = -150
        
    }
    
    // MARK: UI
    
    func animateImageView(){
        UIView.animateKeyframes(withDuration: 5, delay: 0, options: [.autoreverse, .repeat], animations: {
            self.backgroundImageView.center.x += 50
        })
    }
    
    func keyboardSetting(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIApplication.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIApplication.keyboardWillShowNotification, object: nil)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.idTextField.resignFirstResponder()
        self.pwTextField.resignFirstResponder()
    }
}



// MARK: AutoLayout

extension LoginViewController{
    func autoLayout(){
        
        let guide = self.view.safeAreaLayoutGuide
        
        // backgroundImageView
        
        self.backgroundImageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.backgroundImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 50).isActive = true
        self.backgroundImageView.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        self.backgroundImageView.heightAnchor.constraint(equalToConstant: self.view.frame.height).isActive = true
        
        // exit button
        self.exitButton.topAnchor.constraint(equalTo: guide.topAnchor, constant: 10).isActive = true
        self.exitButton.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20).isActive = true
        self.exitButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        self.exitButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        // textField
        
        self.idTextField.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20).isActive = true
        self.idTextField.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20).isActive = true
        self.idTextField.centerYAnchor.constraint(equalTo: guide.centerYAnchor).isActive = true
        self.idTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        self.pwTextField.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20).isActive = true
        self.pwTextField.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20).isActive = true
        self.pwTextField.topAnchor.constraint(equalTo: self.idTextField.bottomAnchor, constant: 5).isActive = true
        self.pwTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        // loginbutton
        self.loginButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20).isActive = true
        self.loginButton.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20).isActive = true
        self.loginButton.centerXAnchor.constraint(equalTo: guide.centerXAnchor).isActive = true
        self.loginButton.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -40).isActive = true
        
    }
}
