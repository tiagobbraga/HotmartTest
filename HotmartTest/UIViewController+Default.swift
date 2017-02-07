//
//  UIViewController+Default.swift
//
//  Created by Tiago Braga on 1/11/16.
//  Copyright © 2016 Tiago Braga. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func customTitleView(_ nameImage: String) {
        if let _ = self.navigationController {
            self.navigationItem.title = ""
            self.navigationItem.titleView = UIImageView.init(image: UIImage.init(named: nameImage))
        }
    }
    
    func customTitleView(_ title: UILabel, withSubtitle subtitle: UILabel) {
        if let _ = self.navigationController {
            self.navigationItem.title = ""
            
            let container = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
            
            title.sizeToFit()
            subtitle.sizeToFit()
            
            container.addSubview(title)
            container.addSubview(subtitle)
            
            self.navigationItem.titleView = container

            let diff = container.center.y

            // title
            var frameTitle = title.frame
            frameTitle.size.width = container.frame.width
            frameTitle.origin.y = diff - frameTitle.size.height
            title.frame = frameTitle

            // subtitle
            var frameSubtitle = subtitle.frame
            frameSubtitle.size.width = container.frame.width
            frameSubtitle.origin.y = frameTitle.origin.y + frameTitle.size.height
            subtitle.frame = frameSubtitle
        }
    }
    
    func customBigTitle(_ title: UILabel) {
        if let _ = self.navigationController {
            self.navigationItem.title = ""
            let container = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
            title.frame = container.bounds
            container.addSubview(title)
            self.navigationItem.titleView = container
            title.center = container.center
        }
    }
    
    func customColorNavigationBar(_ color:UIColor, extendNavigationBar: Bool = false) {
        if let _ = self.navigationController {
            self.navigationController?.navigationBar.shadowImage = UIImage()
            self.navigationController?.navigationBar.backgroundColor = color
            self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
            self.navigationController?.navigationBar.barStyle = UIBarStyle.blackOpaque
            
            if extendNavigationBar {
                self.backgroundStatusBar(color)
            }
        }
    }
    
    func backgroundStatusBar(_ color:UIColor) {
        if let _ = self.navigationController {
            let background = UIView.init(frame: CGRect(x: 0, y: 0, width: self.navigationController!.view.frame.width, height: 20))
            background.backgroundColor = color
            self.navigationController?.view.addSubview(background)
        }
    }
    
    func customBackButton(_ nameImage: String) {
        let imgLeftButton = UIImageView.init(image: UIImage.init(named: nameImage))
        let leftButton = UIButton.init(type: UIButtonType.custom)
        leftButton.addTarget(self, action: #selector(UIViewController.onBack), for: UIControlEvents.touchUpInside)
        leftButton.frame = imgLeftButton.frame
        leftButton.tag = 999
        leftButton.addSubview(imgLeftButton)
        
        if let _ = self.navigationController {
            self.navigationItem.hidesBackButton = true
            self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: leftButton)
        } else {
            leftButton.frame = CGRect(x: 15, y: 30, width: leftButton.frame.width, height: leftButton.frame.height)
            self.view.addSubview(leftButton)
        }
    }
    
    func removeCustomBackButton() {
        if let _ = self.navigationController {
            self.navigationItem.leftBarButtonItem = nil
        } else {
            let leftButton = self.view.viewWithTag(999)
            leftButton?.removeFromSuperview()
        }
    }
    
    func alert(_ title: String, message: String) {
        self.alert(title, message: message, close: nil)
    }
    
    func alert(_ title: String, message: String, close: (() -> Void)?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let done = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (ACTION) -> Void in
            alertController.dismiss(animated: true, completion: nil)
            if let _ = close {
                close!()
            }
        }
        alertController.addAction(done)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func confirm(_ title: String, message: String, no: (() -> Void)?, yes: (() -> Void)?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let noBtn = UIAlertAction(title: "Não", style: UIAlertActionStyle.default) { (ACTION) -> Void in
            alertController.dismiss(animated: true, completion: nil)
            if let _ = no {
                no!()
            }
        }
        let yesBtn = UIAlertAction(title: "Sim", style: UIAlertActionStyle.default) { (ACTION) -> Void in
            alertController.dismiss(animated: true, completion: nil)
            if let _ = yes {
                yes!()
            }
        }
        alertController.addAction(noBtn)
        alertController.addAction(yesBtn)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func isModal() -> Bool {
        if self.presentingViewController != nil {
            return true
        }
        
        if self.presentingViewController?.presentedViewController == self {
            return true
        }
        
        if self.navigationController?.presentingViewController?.presentedViewController == self.navigationController {
            return true
        }
        
        if self.tabBarController?.presentingViewController?.isKind(of: UITabBarController.self) != nil {
            return true
        }
        
        return false
    }
    
    func createWindow(nibNamed named: String, withTag tag: Int) -> UIWindow {
        let waitingView = UIView.loadView(named)
        waitingView!.frame = UIScreen.main.bounds
        
        let newWindow = UIWindow(frame: UIScreen.main.bounds)
        newWindow.windowLevel = UIWindowLevelAlert + 1
        newWindow.addSubview(waitingView!)
        newWindow.makeKeyAndVisible()
        newWindow.tag = tag
        
        return newWindow
    }
    
    func removeWindow(_ window: UIWindow) {
        window.resignKey()
        window.removeFromSuperview()
        window.isHidden = true
    }
    
    func removeWindowByTag(_ tag: Int) {
        for window: UIWindow in UIApplication.shared.windows {
            if window.tag == tag {
                self.removeWindow(window)
                break
            }
        }
    }
    
    func changeControllerInTabBarController(_ index: Int, controller: UIViewController, insideNavigationController:Bool = true) {
        var controllers = self.tabBarController!.viewControllers
        if insideNavigationController {
            let navigationController = UINavigationController(rootViewController: controller)
            controllers![index] = navigationController
        } else {
            controllers![index] = controller
        }
        self.tabBarController!.viewControllers = controllers
    }
    
    // MARK: Action
    func onBack() {
        if let _ = self.navigationController {
            if self.navigationController?.viewControllers.count == 1 && self.isModal() {
                self.dismiss(animated: true, completion: nil)
            } else {
                self.navigationController?.popViewController(animated: true);
            }
        } else {
            self.dismiss(animated: true, completion: nil)
        }        
    }
    
}
