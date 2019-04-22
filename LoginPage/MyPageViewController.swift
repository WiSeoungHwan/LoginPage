//
//  MyPageViewController.swift
//  LoginPage
//
//  Created by Wi on 15/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

class MyPageViewController: UIViewController {

    var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "mypageImage")!)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    var colorView: UIView = {
        let colorView = UIView()
        colorView.translatesAutoresizingMaskIntoConstraints = false
        colorView.backgroundColor = .orange
        return colorView
    }()
    var topAnchor: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    
    func configure(){
        view.addSubview(imageView)
        view.addSubview(colorView)
        view.bringSubviewToFront(imageView)
        
        autolayout()
        
        self.topAnchor?.isActive = true
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
        
    }
    
    func autolayout(){
        
        let guide = self.view.safeAreaLayoutGuide
        
        imageView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: guide.centerYAnchor).isActive = true
        
        colorView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor).isActive = true
        colorView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor).isActive = true
        colorView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
        topAnchor = colorView.topAnchor.constraint(equalTo: imageView.topAnchor)
        
        
    }


}
