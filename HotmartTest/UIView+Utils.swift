//
//  UIView+Utils.swift
//
//  Created by Tiago Braga on 1/14/16.
//  Copyright © 2016 Tiago Braga. All rights reserved.
//

import UIKit

extension UIView {
    
    static func loadView(_ nibNamed: String) -> UIView? {
        return loadView(nibNamed, index: 0)
    }
    
    static func loadView(_ nibNamed: String, index: Int) -> UIView? {
        return loadView(nibNamed, index: index, owner: nil)
    }
    
    static func loadNib(_ nibNamed: String) -> UINib {
        return UINib.init(nibName: nibNamed, bundle: nil)
    }
    
    static func loadView(_ nibNamed: String, index: Int, owner: UIViewController?) -> UIView? {
        return UINib.init(nibName: nibNamed, bundle: nil).instantiate(withOwner: owner, options: nil)[index] as? UIView
    }
    
}
