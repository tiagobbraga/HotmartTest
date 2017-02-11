//
//  CustomAccessBottomViewController.swift
//  HotmartTest
//
//  Created by Tiago Braga on 11/02/17.
//  Copyright © 2017 Tiago Braga. All rights reserved.
//

import UIKit

class CustomAccessBottomViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: Private Methods
    private func goTo(controller: UIViewController) {
        let currentController = (self.slideMenuController()?.mainViewController as! UINavigationController).viewControllers.first
        let newController = (controller as! UINavigationController).viewControllers.first
        
        if currentController!.className != newController!.className {
            self.slideMenuController()?.changeMainViewController(controller, close: true)
        }
    }
    

    // MARK: Actions
    @IBAction func onGoToDashboard(_ sender: Any) {
        self.goTo(controller: AppStoryboard.Dashboard.instance.instantiateViewController(withIdentifier: "Main"))
    }
    
    @IBAction func onGoToSales(_ sender: Any) {
        self.goTo(controller: AppStoryboard.Sales.instance.instantiateViewController(withIdentifier: "Main"))
    }

    @IBAction func onGoToMessages(_ sender: Any) {
        self.goTo(controller: AppStoryboard.Message.instance.instantiateViewController(withIdentifier: "Main"))
    }
}

extension NSObject {
    var className: String {
        return String(describing: type(of: self))
    }
    
    class var className: String {
        return String(describing: self)
    }
}
