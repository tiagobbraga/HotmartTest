//
//  AppStoryboard.swift
//  HotmartTest
//
//  Created by Tiago Braga on 07/02/17.
//  Copyright © 2017 Tiago Braga. All rights reserved.
//

import UIKit

enum AppStoryboard : String {
    case Dashboard = "Main"
    case Message = "Message"
    case Sales = "Sales"
    
    var instance : UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
}
