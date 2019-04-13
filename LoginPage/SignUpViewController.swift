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
        let textField = createTextField("이름을 입력해주세요", UIImage(named: "user")!)
        return textField
    }

    var idTextField: UITextField {
        let textField = createTextField("아이디를 입력해주세요", UIImage(named: "user")!)
        return textField
    }
    
    var pwTextField: UITextField {
        let textField = createTextField("비밀번호를 입력해주세요", UIImage(named: "lock")!)
        textField.isSecureTextEntry = true
        return textField
    }
    
    var phoneNumTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.orange.withAlphaComponent(0.9)
        textField.textColor = .white
        textField.attributedPlaceholder = NSAttributedString(string: "전화번호를 입력해주세요", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.5)])
        textField.leftView = UIImageView(image: UIImage(named: "phone"))
        textField.leftView?.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        textField.layer.cornerRadius = 10
        textField.leftViewMode = .always
        let height = textField.heightAnchor.constraint(equalToConstant: 50)
        height.isActive = true
        height.priority = UILayoutPriority(rawValue: 999)
        textField.keyboardType = .numberPad
        return textField 
    }()
    
    var exitButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "exit"), for: .normal)
        button.addTarget(self, action: #selector(exitButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    var authRequestButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(" 인증요청 ", for: .normal)
        button.setTitleColor(.orange, for: .normal)
        button.setTitleColor(.white, for: .highlighted)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.orange.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 10
        let height = button.heightAnchor.constraint(equalToConstant: 50)
        height.isActive = true
        height.priority = UILayoutPriority.defaultHigh
        button.addTarget(self, action: #selector(authButtonDidTap(_:)), for: .touchUpInside)
        
        return button
    }()
    
    var authTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.orange.withAlphaComponent(0.9)
        textField.textColor = .white
        textField.attributedPlaceholder = NSAttributedString(string: " 인증번호 입력 ", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.5)])
        let height = textField.heightAnchor.constraint(equalToConstant: 40)
        height.isActive = true
        height.priority = UILayoutPriority(rawValue: 999)
        textField.layer.cornerRadius = 10
        textField.keyboardType = .numberPad
        return textField
    }()
    
    var signUpButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(" 가입하기 ", for: .normal)
        button.setTitleColor(.orange, for: .normal)
        button.setTitleColor(.gray, for: .disabled)
        button.setTitleColor(.white, for: .highlighted)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.orange.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 10
        
        button.addTarget(self, action: #selector(signUpButtonDidTap(_:)), for: .touchUpInside)
        return button
    }()
    
    var isViewUp = false
    var textFields = [UITextField]()
    
    // MARK: - Methods
    
    // MARK: lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    
    // MARK: other Func
    
    func configure(){
        
        // textFeild
        settingTextFields()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIApplication.keyboardWillHideNotification, object: nil)
        
        
        // stackView
        
        
        stackView.addArrangedSubview(nameTextField)
        stackView.addArrangedSubview(idTextField)
        stackView.addArrangedSubview(pwTextField)
        stackView.axis = .vertical
        stackView.backgroundColor = UIColor.darkGray.withAlphaComponent(0.5)
        stackView.distribution = .equalSpacing
        stackView.spacing = 20
        
        // addSubView
        view.addSubview(backgroundImageView)
        view.addSubview(stackView)
        view.addSubview(exitButton)
        view.addSubview(phoneNumTextField)
        view.addSubview(authRequestButton)
        view.addSubview(authTextField)
        view.addSubview(signUpButton)
        
        // UI
        autoLayout()

    }
    
    func settingTextFields(){
        textFields.append(nameTextField)
        textFields.append(idTextField)
        textFields.append(pwTextField)
        textFields.append(phoneNumTextField)
        textFields.append(authTextField)
        for i in textFields {
            i.translatesAutoresizingMaskIntoConstraints = false
            i.clearButtonMode = .always
            i.delegate = self
        }
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
        textField.clearButtonMode = .always
        let height = textField.heightAnchor.constraint(equalToConstant: 50)
        height.isActive = true
        height.priority = UILayoutPriority(rawValue: 999)
        textField.delegate = self

        return textField
    }
    
    // MARK: Action
    
    @objc private func keyboardWillHide(_ sender: Notification){
        self.view.frame.origin.y = 0
        isViewUp = false
    }
    @objc private func exitButtonDidTap(_ sender: UIButton){
        self.dismiss(animated: true, completion: nil)
    }
    @objc private func authButtonDidTap(_ sender: UIButton){
        self.view.frame.origin.y = 0
        isViewUp = false
        phoneNumTextField.resignFirstResponder()
    }
    @objc private func signUpButtonDidTap(_ sender: UIButton){
        print("signUpTap")
    }
    
    // MARK: UI
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for i in self.stackView.subviews{
            i.resignFirstResponder()
        }
        phoneNumTextField.resignFirstResponder()
        authTextField.resignFirstResponder()
    }
    
    
    
    func autoLayout(){
        let guide = self.view.safeAreaLayoutGuide
        print("AutoLayout")
        
        // backgroundImageView
        
        self.backgroundImageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.backgroundImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.backgroundImageView.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        self.backgroundImageView.heightAnchor.constraint(equalToConstant: self.view.frame.height).isActive = true
        
        //stackView
        
        self.stackView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20).isActive = true
        self.stackView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20).isActive = true
        self.stackView.topAnchor.constraint(equalTo: guide.topAnchor, constant: 150).isActive = true
        
        // phoneAuth
        
        self.phoneNumTextField.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20).isActive = true
        self.phoneNumTextField.topAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: 20).isActive = true
        self.phoneNumTextField.trailingAnchor.constraint(equalTo: authRequestButton.leadingAnchor, constant: -5).isActive = true
        
        self.authRequestButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        self.authRequestButton.topAnchor.constraint(equalTo: phoneNumTextField.topAnchor).isActive = true
        self.authRequestButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        // exit button
        self.exitButton.topAnchor.constraint(equalTo: guide.topAnchor, constant: 10).isActive = true
        self.exitButton.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20).isActive = true
        self.exitButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        self.exitButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        // authTextField
        
        self.authTextField.topAnchor.constraint(equalTo: self.phoneNumTextField.bottomAnchor, constant: 20).isActive = true
        self.authTextField.centerXAnchor.constraint(equalTo: guide.centerXAnchor).isActive = true
        
        // signUpButton
        
        self.signUpButton.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -20).isActive = true
        self.signUpButton.centerXAnchor.constraint(equalTo: guide.centerXAnchor).isActive = true
        self.signUpButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20).isActive = true
        self.signUpButton.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20).isActive = true
        self.signUpButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }

}

extension SignUpViewController: UITextFieldDelegate{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if !isViewUp{
            if textField == self.phoneNumTextField || textField == self.authTextField{
                UIView.animate(withDuration: 0.8) {
                    self.view.frame.origin.y = -150
                    self.isViewUp = true
                }
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

