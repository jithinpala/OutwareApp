//
//  RootViewController.swift
//  OutwareApp
//
//  Created by Jithin on 8/2/18.
//  Copyright © 2018 Jithinpala. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    // MARK:- IBOutlet declaration
    @IBOutlet weak var animationImageView: UIImageView!
    @IBOutlet weak var appNameLabel: UILabel!
    
    // MARK:- Variable declaration
    var homeNavController: UINavigationController?
    var timer = Timer()
    
    /// ViewDidLoad Method
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Set background for view
        self.view.backgroundColor = UIColor.appThemeBlueColor()
        appNameLabel.alpha = 0.0
    }
    
    
    /// ViewWillApper Method
    ///
    /// - Parameter animated: true of false
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.showImageAnimation()
        //self.launchHomeScreen()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK:- Adding home screen method
extension RootViewController {
    
    /// To remove current navigation controller
    ///
    /// - Parameter viewController: NavigationController
    func removeView(_ viewController: UINavigationController?){
        
        if let vc = viewController {
            vc.popToRootViewController(animated: false)
            vc.view.removeFromSuperview()
            vc.removeFromParentViewController()
        }
    }
    
    /// Launch Home Screen
    @objc func launchHomeScreen() {
        removeView(homeNavController)
        let peopleListController = SWPeopleListViewController.getController()
        homeNavController = UINavigationController(rootViewController: peopleListController)
        homeNavController!.setNavigationBarHidden(true, animated: false)
        self.view.addSubview(homeNavController!.view)
        self.addChildViewController(homeNavController!)
        homeNavController!.didMove(toParentViewController: self)
    }
    
}

// MARK:- Image animation and methods
extension RootViewController {
    
    
    /// Show UIIMageView animation
    func showImageAnimation() {
        SWImageAnimation.sharedInstance.playImageAnimation(animationImageView) { (finished) in
            self.hideImageAnimationandShowLabel()
        }
    }
    
    
    /// Call this method after the completion of UIImageView animation
    func hideImageAnimationandShowLabel() {
        UIView.animate(withDuration: 1, delay: 0.7, options: .curveEaseIn, animations: {
            self.animationImageView.isHidden = true
            self.appNameLabel.alpha = 1.0
        }) { (finished) in
            if self.timer.isValid {
                self.timer.invalidate()
            }
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.launchHomeScreen), userInfo: nil, repeats: false)
        }
    }
}
