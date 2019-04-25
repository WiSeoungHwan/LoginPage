//
//  InsetTextField.swift
//  LoginPage
//
//  Created by Wi on 25/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

class InsetTextField: UITextField {
    
    var inset: CGFloat = 40
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        
        return bounds.inset(by: UIEdgeInsets(top: 0, left: inset, bottom: 0, right: inset))
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: inset, bottom: 0, right: inset))
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: inset, bottom: 0, right: inset))
    }

}
