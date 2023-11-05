//
//  UIView + Extension.swift
//  PodcastApp
//
//  Created by Dmitry Lorents on 04.11.2023.
//

import UIKit

extension UIView {
    
    func addViews(views: UIView...) {
        for view in views {
            self.addSubview(view)
        }
    }
    
    func makeRoundCorners() {
        self.layer.cornerRadius = self.bounds.height / 2
    }
}
