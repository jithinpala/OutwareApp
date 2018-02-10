//
//  SWProgressHUD.swift
//  OutwareApp
//
//  Created by Jithin on 8/2/18.
//  Copyright © 2018 Jithinpala. All rights reserved.
//

import Foundation
import MBProgressHUD

class SWProgressHUD {
    
    /// Create singleton
    static let sharedInstance = SWProgressHUD()
    let hud = MBProgressHUD()
    
    
    /// Show simple progress HUD
    func showHUD() {
        let viewController = self.getRootViewController()
        hud.center = viewController.view.center
        viewController.view.addSubview(hud)
        hud.show(animated: true)
    }
    
    
    /// Show progress HUD with message
    ///
    /// - Parameter message: message as String
    func showHUDWithMessage(message: String) {
        let viewController = self.getRootViewController()
        hud.label.text = message
        hud.center = viewController.view.center
        viewController.view.addSubview(hud)
        hud.show(animated: true)
    }
    
    
    /// Get app root view controller
    ///
    /// - Returns: UIViewcontroller as RootViewController
    func getRootViewController() -> RootViewController {
        let appDelegate  = UIApplication.shared.delegate as! AppDelegate
        let viewController = appDelegate.window!.rootViewController as! RootViewController
        return viewController
    }
    
    
    /// Method to hide the progress HUD
    func hideHUD() {
        hud.hide(animated: true)
    }
    
}
