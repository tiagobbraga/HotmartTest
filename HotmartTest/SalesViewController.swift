//
//  StoreViewController.swift
//  HotmartTest
//
//  Created by Tiago Braga on 06/02/17.
//  Copyright © 2017 Tiago Braga. All rights reserved.
//

import UIKit

class SalesViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = Localizable.string(forKey: "title_sales")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("didReceiveMemoryWarning");
    }

}
