//
//  UIImageView+Proxy.swift
//
//  Created by Tiago Braga on 1/18/16.
//  Copyright © 2016 Tiago Braga. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func cornerRadius(_ borderWidth:CGFloat, borderColor:UIColor, image:UIImage) {
        config(self.frame.height / 2, borderWidth: borderWidth, borderColor: borderColor, image: image)
    }
    
    func cornerRadius(_ cornerRadius:CGFloat, namedImage:String) {
        config(cornerRadius, borderWidth: 0, borderColor: UIColor.clear, image: UIImage.init(named: namedImage)!)
    }
    
    func cicleMask(_ image:UIImage) {
        config(self.frame.height / 2, borderWidth: 0, borderColor: UIColor.clear, image: image)
    }
    
    // Private
    func config(_ cornerRadius:CGFloat, borderWidth: CGFloat, borderColor: UIColor, image: UIImage) {
        self.image = image
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
    }
    
}
