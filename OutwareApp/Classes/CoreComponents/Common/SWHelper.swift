//
//  SWHelper.swift
//  OutwareApp
//
//  Created by Jithin on 9/2/18.
//  Copyright © 2018 Jithinpala. All rights reserved.
//

import Foundation
import UIKit

class SWHelper {
    
    /// Method to get people gender
    ///
    /// - Parameter genderType: PeopleGender enum
    /// - Returns: Gender as string value
    class func getProfileImageForGender(genderType: PeopleGender) -> String{
        switch genderType {
        case .male:
            return "Male"
        case .female:
            return "Female"
        default:
            return "NoGender"
        }
    }
    
    /// Method to parse the eye color and count the eye color
    ///
    /// - Parameter peopleListArray: PeopleModel array fetch from the url call
    /// - Returns: Dictionay where Eye color as key and count as value
    class func getTheCountForEyeColor(peopleListArray: [PeopleModel]) -> [String: Int] {
        //print(Array(Set(peopleListArray.map({$0.peopleEyeColor!}))))
        let result = peopleListArray.map({$0.peopleEyeColor!})
        var counts: [String: Int] = [:]
        for item in result {
            counts[item] = (counts[item] ?? 0) + 1
        }        
        return counts
    }    
    
}
