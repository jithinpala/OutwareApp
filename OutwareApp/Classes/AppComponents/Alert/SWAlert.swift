//
//  SWAlert.swift
//  OutwareApp
//
//  Created by Jithin on 9/2/18.
//  Copyright © 2018 Jithinpala. All rights reserved.
//

import UIKit

class SWAlert: NSObject {
    
    static let sharedInstance = SWAlert()
    
    /// Show Alert on current controller
    ///
    /// - parameter msg: Message to be alerted
    /// - parameter vc:  Controller where alert to be show
    class func ShowSimpleAlert(withMessage msg:String, inController vc:UIViewController?){
        
        let alert = UIAlertController(title: "Product.Display.Name".localized(), message: msg, preferredStyle: .alert)
        let actionOk = UIAlertAction(title: "alert.button.ok".localized(), style: .default) { (action) in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(actionOk)
        guard vc != nil else{
            UIApplication.topViewController()!.present(alert, animated: true, completion: nil)
            return
        }
        vc!.present(alert, animated: true, completion: nil)
    }
    
    
    /// Show Alert on current controller and return the handler with true after OK button click
    ///
    /// - Parameters:
    ///   - msg: Message to be alerted with
    ///   - vc: Controller where alert to be shown in
    ///   - completionHandler: call back, OK button tap action
    class func ShowSimpleAlertWithHandler(withMessage msg:String, inController vc:UIViewController?, completionHandler: @escaping (_ result: Bool?) -> Void){
        
        let alert = UIAlertController(title: "Product.Display.Name".localized(), message: msg, preferredStyle: .alert)
        let actionOk = UIAlertAction(title: "alert.button.ok".localized(), style: .default) { (action) in
            alert.dismiss(animated: true, completion: nil)
            completionHandler(true)            
        }
        alert.addAction(actionOk)
        guard vc != nil else{
            UIApplication.topViewController()!.present(alert, animated: true, completion: nil)
            return
        }
        vc!.present(alert, animated: true, completion: nil)
    }
    
    

}
