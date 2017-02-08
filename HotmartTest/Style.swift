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
        
        static let yellow: UIColor = UIColor(red: 232, green: 173, blue: 69)
        static let orange: UIColor = UIColor(red: 208, green: 78, blue: 42)
        static let blue: UIColor = UIColor(red: 73, green: 130, blue: 197)
        
        static let purple: UIColor = UIColor(red: 95, green: 72, blue: 140)
        static let green: UIColor = UIColor(red: 163, green: 199, blue: 75)
        static let pink: UIColor = UIColor(red: 207, green: 66, blue: 82)
        
        static let grey_dark: UIColor = UIColor(red: 83, green: 83, blue: 83)
        static let grey_light: UIColor = UIColor(red: 145, green: 145, blue: 145)
        static let almost_white: UIColor = UIColor(red: 244, green: 244, blue: 244)
    }
    
    static func general() {
        // NavitaionBar
        let attributes: [String: AnyObject] = [
            NSForegroundColorAttributeName: Color.white,
            NSFontAttributeName: UIFont(name: "Helvetica-Bold", size: 16)!
        ]
        
        let nva = UINavigationBar.appearance()        
        nva.titleTextAttributes = attributes
        nva.isTranslucent = true
        nva.tintColor = Color.white
        nva.barTintColor = Color.white
    }
    
}
