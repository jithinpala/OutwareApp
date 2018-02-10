//
//  ColorExtension.swift
//  OutwareApp
//
//  Created by Jithin on 8/2/18.
//  Copyright © 2018 Jithinpala. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    /// Method to create UIColor from values
    ///
    /// - Parameters:
    ///   - red: Int value <= 255
    ///   - green: Int value <= 255
    ///   - blue: Int value <= 255
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    /// Method to create UIColor from values
    ///
    /// - Parameter netHex: Hex values
    convenience init(netHex:Int) {
        
        self.init(red:(CGFloat((netHex & 0xFF0000) >> 16) / CGFloat(255.0)), green:(CGFloat((netHex & 0xFF00) >> 8) / CGFloat(255.0)), blue:(CGFloat(netHex & 0xFF) / CGFloat(255.0)), alpha: 1.0)
       
    }
    
    /// Method to create UIColor from values
    ///
    /// - Parameters:
    ///   - hexString: Hex string eg #FFFFFF
    ///   - alpha: Alpha componebt 0 to 1
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    
    /// Method to get UIColor
    ///
    /// - Returns: UIColor
    class func appThemeBlueColor() -> UIColor {
        return UIColor(red: 23.0/255.0, green: 95.0/255.0, blue: 173.0/255.0, alpha: 1)
    }
    
}
