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
    
//    var exitButton: UIButton = {
//        let button = UIButton(type: .custom)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setImage(UIImage(named: "exit"), for: .normal)
//        button.addTarget(self, action: #selector(exitButtonDidTap), for: .touchUpInside)
//        return button
//    }()
    
    var idTextField: InsetTextField = {
        let textField = InsetTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = .black
        textField.attributedPlaceholder = NSAttributedString(string: "이메일을 입력해주세요", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray.withAlphaComponent(0.5)])
        textField.borderStyle = .roundedRect
        textField.leftView = UIImageView(image: UIImage(named: "mail"))
        textField.leftView?.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        textField.leftViewMode = .always
        return textField
    }()
    
    var pwTextField: InsetTextField = {
        let textField = InsetTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = .black
        textField.attributedPlaceholder = NSAttributedString(string: "비밀번호를 입력해주세요", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray.withAlphaComponent(0.5)])
        textField.borderStyle = .roundedRect
        textField.leftView = UIImageView(image: UIImage(named: "lock"))
        textField.leftView?.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        textField.leftViewMode = .always
        textField.isSecureTextEntry = true
        return textField
    }()
    
    var loginButton: UIButton = {
        let button: UIButton = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 25
        button.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        button.setTitle("Login", for: .normal)
        button.setTitleColor( UIColor.white.withAlphaComponent(0.5), for: .highlighted)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    var signUpButton: UIButton = {
        let button: UIButton = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor( #colorLiteral(red: 0.4620226622, green: 0.8382837176, blue: 1, alpha: 1), for: .normal)
        button.setTitleColor( UIColor.white.withAlphaComponent(0.5), for: .highlighted)
        button.underlineMyText()
        button.addTarget(self, action: #selector(signUpButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    var signUpLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "아직 회원이 아니신가요?"
        return label
    }()
    
    var testId = "wi"
    var testPw = "1111"
    
    
    // MARK: - Method
    
    // MARK: life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animateImageView()
    }
    
    // MARK: other func
    private func configure(){
        
        // delegate
        self.idTextField.delegate = self
        self.pwTextField.delegate = self
        
        // addSubview
//        self.view.addSubview(backgroundImageView)
//        self.view.addSubview(exitButton)
        self.view.addSubview(signUpLabel)
        self.view.addSubview(idTextField)
        self.view.addSubview(pwTextField)
        self.view.addSubview(loginButton)
        self.view.addSubview(signUpButton)
        
        // UI
        keyboardSetting()
        uiSetting()
        // autoLayout
        
        autoLayout()
    }
    
    
    // MARK: Action
    
//    @objc private func exitButtonDidTap(_ sender: UIButton){
//        self.dismiss(animated: true, completion: nil)
//    }
    
    @objc private func loginButtonDidTap(_ sender: UIButton){
        guard let id = idTextField.text, let pw = pwTextField.text else {return}
        
        if id == testId && pw == testPw{
            print("login Success")
            let navi = UINavigationController(rootViewController: MyRecipeViewController())
            present(navi, animated: true, completion: nil)
        }else{
            print("login Fail")
        }
    }
    
    @objc private func signUpButtonDidTap(_ sender: UIButton){
        print("signUpButton")
        let signUpVC = SignUpViewController()
        present(signUpVC, animated: true, completion: nil)
        sender.layoutSubviews()
        
    }
    
    @objc private func keyboardWillHide(_ sender: Notification){
        self.view.frame.origin.y = 0
    }
    @objc private func keyboardWillShow(_ sender: Notification){
        self.view.frame.origin.y = -150
    }
    
    
    
    // MARK: UI
    
    func uiSetting(){
        self.idTextField.layer.cornerRadius = 10
        self.pwTextField.layer.cornerRadius = 10
        self.idTextField.clearButtonMode = .always
        self.pwTextField.clearButtonMode = .always
    }
    
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
        
//        self.backgroundImageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
//        self.backgroundImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 50).isActive = true
//        self.backgroundImageView.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
//        self.backgroundImageView.heightAnchor.constraint(equalToConstant: self.view.frame.height).isActive = true
        
        // exit button
//        self.exitButton.topAnchor.constraint(equalTo: guide.topAnchor, constant: 10).isActive = true
//        self.exitButton.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20).isActive = true
//        self.exitButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
//        self.exitButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        // textField
        
        self.idTextField.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 30).isActive = true
        self.idTextField.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -30).isActive = true
        self.idTextField.bottomAnchor.constraint(equalTo: guide.centerYAnchor).isActive = true
        self.idTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        self.pwTextField.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 30).isActive = true
        self.pwTextField.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -30).isActive = true
        self.pwTextField.topAnchor.constraint(equalTo: guide.centerYAnchor, constant: 20).isActive = true
        self.pwTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        // signUpButton
        self.signUpButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20).isActive = true
        self.signUpButton.centerXAnchor.constraint(equalTo: guide.centerXAnchor, constant: 80).isActive = true
        
        self.signUpLabel.trailingAnchor.constraint(equalTo: signUpButton.leadingAnchor, constant: -5).isActive = true
        self.signUpLabel.centerYAnchor.constraint(equalTo: signUpButton.centerYAnchor).isActive = true
        // loginbutton
        self.loginButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 50).isActive = true
        self.loginButton.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -50).isActive = true
        self.loginButton.centerXAnchor.constraint(equalTo: guide.centerXAnchor).isActive = true
        self.loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.loginButton.topAnchor.constraint(equalTo: pwTextField.bottomAnchor, constant: 40).isActive = true
        
        
    }
}





// MARK: - Other Extention

extension UIButton {
    func underlineMyText() {
        guard let text = self.titleLabel?.text else { return }
        
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: text.count))
        
        self.setAttributedTitle(attributedString, for: .normal)
    }
}



extension UILabel {
    func underlineMyText() {
        if let textString = self.text {
            let attributedString = NSMutableAttributedString(string: textString)
            attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: attributedString.length - 1))
            attributedText = attributedString
        }
    }
}


extension UITextField {
    func setUnderLine() {
        let border = CALayer()
        let width = CGFloat(0.5)
        border.borderColor = UIColor.lightGray.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width-10, height: self.frame.size.height)
        
        border.borderWidth = width
        self.layer.addSublayer(border)
        border.isHidden = false
        self.layer.masksToBounds = true
    }
}


