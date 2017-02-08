//
//  DashboardViewController.swift
//  HotmartTest
//
//  Created by Tiago Braga on 06/02/17.
//  Copyright © 2017 Tiago Braga. All rights reserved.
//

import UIKit

class DashboardViewController: BaseViewController {

    @IBOutlet weak var buceta: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = Localizable.string(forKey: "title_dashboard")
        
        self.customColorNavigationBar(Style.Color.orange, extendNavigationBar: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("didReceiveMemoryWarning");
    }

}
