//
//  CustomProfileButton.swift
//  PodcastApp
//
//  Created by  Dmitry on 07.10.2023.
//

import UIKit

class CustomProfileButton: UIButton {
    
    var imageViewCheck: UIImageView!
    
    init(title: String, isPressed: Bool) {
        super.init(frame: .zero)
        
        self.setTitle(title, for: .normal)
        self.setTitleColor(.black, for: .normal)
        self.titleLabel?.font = .custome(name: .plusJakartaSans600, size: 16)
        self.clipsToBounds = true
        self.backgroundColor = .systemBackground
        self.layer.borderColor =  isPressed ? UIColor.customBlue.cgColor : UIColor.gray.cgColor
        self.layer.borderWidth = 1
        
        //add imageView
        let image = UIImage(systemName: isPressed ? "checkmark.circle.fill" : "circle" )
        imageViewCheck = UIImageView(image: image)
        imageViewCheck.tintColor = .customBlue
        self.addSubview(imageViewCheck)
        //set image position
        imageViewCheck.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview().inset(12)
            make.height.equalTo(imageViewCheck.snp.width)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
