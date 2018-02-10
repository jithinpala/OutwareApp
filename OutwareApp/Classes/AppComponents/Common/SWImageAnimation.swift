//
//  SWImageAnimation.swift
//  OutwareApp
//
//  Created by Jithin on 9/2/18.
//  Copyright © 2018 Jithinpala. All rights reserved.
//

import UIKit

class SWImageAnimation: NSObject, CAAnimationDelegate {
    
    /// Singleton object
    static var sharedInstance = SWImageAnimation()
    
    /// Closure
    var completionHandler: ((_ flag: Bool) -> Void)?
    
    /// Method to do animation  inUIImageView
    ///
    /// - Parameters:
    ///   - imageView: current UIImageView
    ///   - successBlock: Block to notify the completion of animation status
    func playImageAnimation(_ imageView: UIImageView, completionBlock successBlock: @escaping ((_ flag: Bool) -> Void)) {
        completionHandler = successBlock
        var imageArray = [UIImage]()
        for value in 1...8 {
            imageArray.append(UIImage(named:"animationImage\(value)")!)
        }        
        let imageAnimation = CAKeyframeAnimation(keyPath: "contents")
        imageAnimation.calculationMode = kCAAnimationDiscrete
        imageAnimation.duration = 3
        imageAnimation.values = imageArray.map {$0.cgImage as AnyObject}
        imageAnimation.repeatCount = 1
        imageAnimation.delegate = self
        imageView.layer.add(imageAnimation, forKey: "animation")
    }
    
    
    /// CAAnimation delegate
    ///
    /// - Parameters:
    ///   - anim: Animation
    ///   - flag: Bool to check animation status
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        completionHandler!(flag)
    }

}
