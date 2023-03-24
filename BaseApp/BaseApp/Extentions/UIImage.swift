//
//  UIImage.swift
//  Guncha
//
//  Created by Shirin on 2/9/23.
//

import UIKit.UIImageView

extension UIImageView {
    
    convenience init(contentMode: UIView.ContentMode,
                     cornerRadius: CGFloat,
                     image: UIImage? = nil,
                     backgroundColor: UIColor) {
        
        self.init(frame: .zero)
        self.contentMode = contentMode
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
        self.image = image
        self.clipsToBounds = true
    }
}
