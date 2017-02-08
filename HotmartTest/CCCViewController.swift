//
//  CCC = ControlContentContainer
//
//  CCCViewController.swift
//  HotmartTest
//
//  Created by Tiago Braga on 4/25/16.
//  Copyright © 2016 Tiago Braga. All rights reserved.
//

import UIKit

class CCCViewController: BaseViewController {
    
    internal var controllers = [UIViewController]()
    internal var currentViewControllerOnContainer: UIViewController!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Public Methods
    internal func configureContainerWithViewController(_ viewController: UIViewController, inContainer container: UIView) {
        if let _ = currentViewControllerOnContainer {
            self.removeCurrentViewController()

            let controllerInCache = self.hasActiveViewControllerWithStoryboardIdentifier(viewController.restorationIdentifier!)
            if controllerInCache == nil {
                self.controllers.append(viewController)
            }
            
            self.addController(controllerInCache != nil ? controllerInCache! : viewController, inContainer: container)

            return
        }
        
        self.addController(viewController, inContainer: container)
        self.controllers.append(viewController)
    }
    
    internal func removeCurrentViewController() {
        self.controllers.removeObject(self.currentViewControllerOnContainer)
        currentViewControllerOnContainer.view.removeFromSuperview()
        currentViewControllerOnContainer.removeFromParentViewController()
        currentViewControllerOnContainer = nil
    }
    
    // MARK: Private Methods
    fileprivate func hasActiveViewControllerWithStoryboardIdentifier(_ identifier: String) -> UIViewController? {
        return self.controllers.filter({$0.restorationIdentifier == identifier}).first
    }
    
    fileprivate func addController(_ viewController: UIViewController, inContainer container: UIView) {
        self.addChildViewController(viewController)
        container.addSubview(viewController.view)
        addConstraintsToPinSubviewIfNeeded(viewController.view, inContainer: container) // contraint?
        viewController.didMove(toParentViewController: self)
        currentViewControllerOnContainer = viewController
    }
    
    fileprivate func addConstraintsToPinSubviewIfNeeded(_ subView: UIView, inContainer container: UIView) {
        let subViewIdentifiers = ["subView": subView]
        subView.translatesAutoresizingMaskIntoConstraints = false
        
        let pinHorizontalConstraint = NSLayoutConstraint.constraints(withVisualFormat: "H:|[subView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: subViewIdentifiers)
        let pinVerticalConstraint = NSLayoutConstraint.constraints(withVisualFormat: "V:|[subView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: subViewIdentifiers)
        let pinConstraints = pinHorizontalConstraint + pinVerticalConstraint
        
        container.addConstraints(pinConstraints)
        container.layoutIfNeeded()
    }
    
    // MARK: Actions

}
