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
    
    var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
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
    
    var phoneNumberTextField: TextFieldView = {
        let textFieldView = TextFieldView()
        textFieldView.textField.leftView = UIImageView(image: UIImage(named: "phone"))
        textFieldView.textField.attributedPlaceholder = NSAttributedString(string: "- 없이 입력해주세요", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray.withAlphaComponent(0.5)])
        textFieldView.textField.leftView?.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        let button = UIButton(type: .custom)
        button.setTitle("번호 인증", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(#colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1), for: .selected)
        button.setTitleColor(#colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1), for: .highlighted)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(phoneNumberCheckButtonDidTap), for: .touchUpInside)
        textFieldView.textField.rightView = button
        textFieldView.textField.keyboardType = .numberPad
        textFieldView.textField.rightViewMode = .always
        textFieldView.textField.rightView?.frame = CGRect(x: 0, y: 0, width: 60, height: 30)
        return textFieldView
    }()
    
    var boyButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("남자", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.borderWidth = 0.5
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(genderButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    var girlButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("여자", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.borderWidth = 0.5
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(genderButtonDidTap), for: .touchUpInside)
        return button
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
    
    // MARK: - Methods
    
    // MARK: lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    
    // MARK: other Func
    
    func configure(){
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIApplication.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIApplication.keyboardWillShowNotification, object: nil)
        
        // stackView
        
        
        stackView.addArrangedSubview(idTextField)
        stackView.addArrangedSubview(nameTextField)
        stackView.addArrangedSubview(pwTextField)
        stackView.addArrangedSubview(rePWTextField)
        stackView.addArrangedSubview(phoneNumberTextField)
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 40
        
        stackView.arrangedSubviews.forEach{($0 as! TextFieldView).textField.delegate = self
            addButtonToTextField(textField:($0 as! TextFieldView).textField)
        }
        
        
        // addSubView
        
        scrollView.addSubview(stackView)
        scrollView.isScrollEnabled = true
        scrollView.scrollsToTop = true // 상태바를 누르면 가장 상단으로 감
        scrollView.isDirectionalLockEnabled = true
        scrollView.contentSize = CGSize(width: view.frame.width, height: stackView.frame.height)
        scrollView.showsVerticalScrollIndicator = true
        scrollView.alwaysBounceVertical = true
        scrollView.contentSize.height = 1000
        
        
        
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        view.addSubview(exitButton)
        view.addSubview(signUpButton)
        //        view.addSubview(boyButton)
        //        view.addSubview(girlButton)
        
        // UI
        autoLayout()
        
    }
    
    func addButtonToTextField(textField: InsetTextField){
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        if true {
            let nextBtn = UIBarButtonItem(title: "Next", style: .done, target: self, action: #selector(doneBtnDidTap))
            toolBar.items = [flexibleSpace, nextBtn]
        }else if textField == phoneNumberTextField.textField {
            let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneBtnDidTap))
            toolBar.items = [flexibleSpace, doneBtn]
        }
        
        textField.inputAccessoryView = toolBar
    }
    
    
    // MARK: Action
    
    @objc private func keyboardWillHide(_ sender: Notification){
        self.view.frame.origin.y = 0
        isViewUp = false
    }
    @objc private func keyboardWillShow(_ sender: Notification){
        isViewUp = false
    }
    @objc private func doneBtnDidTap(){
        for i in self.stackView.subviews{
            (i as! TextFieldView).textField.resignFirstResponder()
        }
    }
    @objc private func exitButtonDidTap(_ sender: UIButton){
        self.dismiss(animated: true, completion: nil)
    }
    @objc private func doubleCheck(_ sender: UIButton){
        print("doubleCheck")
    }
    @objc private func signUpButtonDidTap(_ sender: UIButton){
        print("signUpTap")
        let userinfo = ["":""]
        //        UserManager.singleton.signUp(info: <#T##[String : String]#>, completion: <#T##((Bool) -> ())##((Bool) -> ())##(Bool) -> ()#>)
    }
    @objc private func phoneNumberCheckButtonDidTap(_ sender: UIButton){
        print("phoneNumberCheck")
        phoneNumberTextField.textField.resignFirstResponder()
    }
    @objc private func genderButtonDidTap(_ sender: UIButton){
        if sender == boyButton {
            if girlButton.isSelected == true{
                girlButton.isSelected = false
                girlButton.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
            boyButton.isSelected.toggle()
            boyButton.backgroundColor = boyButton.isSelected ?  #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1) : #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            
        }else{
            if boyButton.isSelected == true{
                boyButton.isSelected = false
                boyButton.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
            girlButton.isSelected.toggle()
            girlButton.backgroundColor = sender.isSelected ?  #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1) : #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
        
    }
    
    // MARK: UI
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touch")
        for i in self.stackView.subviews{
            (i as! TextFieldView).textField.resignFirstResponder()
        }
    }
    
    
    
    func autoLayout(){
        let guide = self.view.safeAreaLayoutGuide
        
        //stackView
        
        scrollView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: signUpButton.topAnchor, constant:  40).isActive = true
        
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 300).isActive = true
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        // gender button
        //        self.boyButton.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -10).isActive = true
        //        self.boyButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 50).isActive = true
        //        self.boyButton.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.4).isActive = true
        //
        //        self.girlButton.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 10).isActive = true
        //        self.girlButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 50).isActive = true
        //        self.girlButton.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.4).isActive = true
        
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
//        if !isViewUp{
//            UIView.animate(withDuration: 0.8) {
//                self.view.frame.origin.y = -150
//                self.isViewUp = true
//            }
//
//        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("end")
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

