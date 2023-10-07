//
//  CustomTextFieldProfile.swift
//  PodcastApp
//
//  Created by  Dmitry on 07.10.2023.
//

import UIKit

class CustomTextFieldProfile: UITextField {
    
    init(placeholder: String) {
        super.init(frame: .zero)
        self.placeholder = placeholder
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        self.leftViewMode = .always
        self.layer.masksToBounds = true
        self.layer.borderColor =  UIColor.blue.cgColor
        self.layer.borderWidth = 1
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
