//
//  MainViewController.swift
//  HotmartTest
//
//  Created by Tiago Braga on 05/02/17.
//  Copyright © 2017 Tiago Braga. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

class MainViewController: SlideMenuController {
    
    override func awakeFromNib() {
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "Main") {
            self.mainViewController = controller
        }
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "Menu") {
            self.leftViewController = controller
        }
        
        SlideMenuOptions.contentViewScale = 1
        SlideMenuOptions.contentViewOpacity = 0.3
        SlideMenuOptions.opacityViewBackgroundColor = Style.Color.black
        
        super.awakeFromNib()
    }
    
}
