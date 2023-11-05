//
//  CustomProfileButton.swift
//  PodcastApp
//
//  Created by  Dmitry on 07.10.2023.
//

import UIKit

class CustomProfileButton: UIButton {
    
    init(title: String, isPressed: Bool) {
        super.init(frame: .zero)
        var configuration = UIButton.Configuration.plain()
        configuration.image = UIImage(systemName: isPressed ? "checkmark.circle.fill" : "circle" )
        configuration.imagePlacement = .leading
        configuration.imagePadding = 5
        configuration.title = title
        configuration.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(pointSize: 15)
        self.configuration = configuration
        self.tintColor = .customBlue
        self.clipsToBounds = true
        self.backgroundColor = .systemBackground
        self.layer.borderColor =  UIColor.customBlue.cgColor
        self.layer.borderWidth = 1
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
