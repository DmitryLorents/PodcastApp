//
//  CustomPhotoButton.swift
//  PodcastApp
//
//  Created by Dmitry Lorents on 04.11.2023.
//

import UIKit

class CustomPhotoButton: UIButton {
    
    init(title: String, imageName: String) {
        super.init(frame: .zero)
        var configuration = UIButton.Configuration.plain()
//        configuration.image = UIImage(named: imageName)
//        configuration.imagePlacement = .leading
//        configuration.imagePadding = 5
        configuration.title = title
        configuration.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(pointSize: 15)
        self.configuration = configuration
        self.tintColor = .black
        self.clipsToBounds = true
        self.backgroundColor = .systemGray5
        self.layer.cornerRadius = 8
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
