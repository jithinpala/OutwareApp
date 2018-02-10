//
//  UIStoryboard+Helpers.swift
//  OutwareApp
//
//  Created by Jithin on 8/2/18.
//  Copyright © 2018 Jithinpala. All rights reserved.
//

import Foundation
import UIKit

extension UIStoryboard {
    
    /// Returns an instance of the main storyboard
    static func mainStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    /// Returns an instance of the lanuchscreen storyboard
    static func launchStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "LanuchScreen", bundle: Bundle.main)
    }
    /// Returns an instance of the home storyboard
    static func homeStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "Home", bundle: Bundle.main)
    }
    
}
