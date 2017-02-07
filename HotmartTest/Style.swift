//
//  Style.swift
//  HotmartTest
//
//  Created by Tiago Braga on 06/02/17.
//  Copyright © 2017 Tiago Braga. All rights reserved.
//

import UIKit

struct Style {
    
    struct Color {
        static let white: UIColor = UIColor.white
        static let black: UIColor = UIColor.black
        
        static let blue: UIColor = UIColor(netHex: 0x4982c5)
        static let orange: UIColor = UIColor(red: 208, green: 78, blue: 42)
    }
    
    static func general() {
        // NavitaionBar
        let attributes: [String: AnyObject] = [
            NSForegroundColorAttributeName: UIColor.white,
            NSFontAttributeName: UIFont(name: "Helvetica-Bold", size: 16)!
        ]
        
        let nva = UINavigationBar.appearance()        
        nva.titleTextAttributes = attributes
        nva.isTranslucent = true
        nva.tintColor = Color.white
        nva.barTintColor = Color.white
    }
    
}
