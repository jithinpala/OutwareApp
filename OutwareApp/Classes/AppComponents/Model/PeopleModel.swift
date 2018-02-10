//
//  PeopleModel.swift
//  OutwareApp
//
//  Created by Jithin on 8/2/18.
//  Copyright © 2018 Jithinpala. All rights reserved.
//

import UIKit
import UIKit
import SwiftyJSON

/// The People model class
/// This class will parse webservice data for itself and keep in an array
class PeopleModel: NSObject {

    var peopleName: String?
    var peopleGender: PeopleGender?
    var peopleEyeColor: String?
    var peopleSkinColor: String?
    var peopleHairColor: String?
    var peopleMass: Float?
    var peopleHeight: Float?    
    
    override init() {
        super.init()
    }
    
    /// Method to paser result json from url call
    ///
    /// - Parameter resultArray: json result
    init(resultArray: JSON) {
        super.init()
        self.peopleName = resultArray["name"].stringValue
        switch resultArray["gender"].stringValue {
        case "male":
            self.peopleGender = PeopleGender.male
        case "female":
            self.peopleGender = PeopleGender.female
        default:
            self.peopleGender = PeopleGender.nogender
        }        
        self.peopleEyeColor = resultArray["eye_color"].stringValue
        self.peopleSkinColor = resultArray["skin_color"].stringValue
        self.peopleHairColor = resultArray["hair_color"].stringValue
        self.peopleMass = resultArray["mass"].floatValue
        self.peopleHeight = resultArray["height"].floatValue
    }
    
}
