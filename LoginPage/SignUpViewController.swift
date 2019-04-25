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
    
//    var backgroundImageView: UIImageView = {
//        let imageView = UIImageView(image: UIImage(named: "backgroundImage2"))
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.contentMode = UIView.ContentMode.scaleAspectFill
//        return imageView
//    }()
    
    var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var nameTextField: TextFieldView = {
        let textFieldView = TextFieldView()
        textFieldView.textField.leftView = UIImageView(image: UIImage(named: "user"))
        textFieldView.textField.attributedPlaceholder = NSAttributedString(string: "닉네임을 입력해주세요", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray.withAlphaComponent(0.5)])
        textFieldView.textField.leftView?.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        let button = UIButton(type: .custom)
        button.setTitle("중복 확인", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(#colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1), for: .selected)
        button.setTitleColor(#colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1), for: .highlighted)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(doubleCheck), for: .touchUpInside)
        textFieldView.textField.rightView = button
        textFieldView.textField.rightViewMode = .always
        textFieldView.textField.rightView?.frame = CGRect(x: 0, y: 0, width: 60, height: 30)
        return textFieldView
    }()

    var idTextField: TextFieldView = {
        let textFieldView = TextFieldView()
        textFieldView.textField.leftView = UIImageView(image: UIImage(named: "mail"))
        textFieldView.textField.attributedPlaceholder = NSAttributedString(string: "이메일을 입력해주세요", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray.withAlphaComponent(0.5)])
        textFieldView.underLabel.text  = "*이메일 인증을 위해 유효한 이메일을 입력해주세요."
        textFieldView.textField.leftView?.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        return textFieldView
    }()
    
    var pwTextField: TextFieldView = {
        let textFieldView = TextFieldView()
        textFieldView.textField.leftView = UIImageView(image: UIImage(named: "lock"))
        textFieldView.textField.attributedPlaceholder = NSAttributedString(string: "비밀번호를 입력해주세요", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray.withAlphaComponent(0.5)])
        textFieldView.textField.leftView?.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        return textFieldView
    }()
    
    var rePWTextField: TextFieldView = {
        let textFieldView = TextFieldView()
        textFieldView.textField.leftView = UIImageView(image: UIImage(named: "lock"))
        textFieldView.textField.attributedPlaceholder = NSAttributedString(string: "비밀번호를 재입력해주세요", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray.withAlphaComponent(0.5)])
        textFieldView.textField.leftView?.frame = CGRect(x: 0, y: 0, width: 30, height: 30)

        return textFieldView
    }()
    
    var boyButton: UIButton = {
        var button = UIButton()
        return
    }()
    
    
    var exitButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "exit"), for: .normal)
        button.addTarget(self, action: #selector(exitButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    
    var signUpButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(" 가입하기 ", for: .normal)
        button.layer.cornerRadius = 25
        button.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        button.setTitle("Login", for: .normal)
        button.setTitleColor( UIColor.white.withAlphaComponent(0.5), for: .highlighted)
        button.setTitleColor(.white, for: .normal)
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
//        settingTextFields()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIApplication.keyboardWillHideNotification, object: nil)
        
        
        // stackView
        
        
        stackView.addArrangedSubview(idTextField)
        stackView.addArrangedSubview(nameTextField)
        stackView.addArrangedSubview(pwTextField)
        stackView.addArrangedSubview(rePWTextField)
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 80
        
        // addSubView
//        view.addSubview(backgroundImageView)
        view.addSubview(stackView)
        view.addSubview(exitButton)
        view.addSubview(signUpButton)
        
        // UI
        autoLayout()

    }

    
    // MARK: Action
    
    @objc private func keyboardWillHide(_ sender: Notification){
        self.view.frame.origin.y = 0
        isViewUp = false
    }
    @objc private func exitButtonDidTap(_ sender: UIButton){
        self.dismiss(animated: true, completion: nil)
    }
    @objc private func doubleCheck(_ sender: UIButton){
        print("doubleCheck")
    }
    @objc private func signUpButtonDidTap(_ sender: UIButton){
        print("signUpTap")
    }
    
    // MARK: UI
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for i in self.stackView.subviews{
            i.resignFirstResponder()
        }
    }
    
    
    
    func autoLayout(){
        let guide = self.view.safeAreaLayoutGuide
        
        // backgroundImageView
        
//        self.backgroundImageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
//        self.backgroundImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        self.backgroundImageView.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
//        self.backgroundImageView.heightAnchor.constraint(equalToConstant: self.view.frame.height).isActive = true
        
        //stackView
        
        self.stackView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20).isActive = true
        self.stackView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20).isActive = true
        self.stackView.topAnchor.constraint(equalTo: guide.topAnchor, constant: 150).isActive = true
        
        
        // exit button
        self.exitButton.topAnchor.constraint(equalTo: guide.topAnchor, constant: 10).isActive = true
        self.exitButton.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20).isActive = true
        self.exitButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        self.exitButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
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
            UIView.animate(withDuration: 0.8) {
                self.view.frame.origin.y = -150
                self.isViewUp = true
            }
            
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

