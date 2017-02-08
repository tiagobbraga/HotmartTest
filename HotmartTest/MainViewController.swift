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
        
        self.mainViewController = AppStoryboard.Dashboard.instance.instantiateViewController(withIdentifier: "Main")
        self.leftViewController = AppStoryboard.Main.instance.instantiateViewController(withIdentifier: "Menu")
        
        SlideMenuOptions.contentViewScale = 1
        SlideMenuOptions.contentViewOpacity = 0.3
        SlideMenuOptions.opacityViewBackgroundColor = Style.Color.black
        
        super.awakeFromNib()
    }
    
}
