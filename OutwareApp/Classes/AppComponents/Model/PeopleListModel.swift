//
//  PeopleListModel.swift
//  OutwareApp
//
//  Created by Jithin on 8/2/18.
//  Copyright © 2018 Jithinpala. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

/// The PeopleList model class
/// This class will parse webservice data for itself and keep in an array
class PeopleListModel: NSObject {
    
    var previousUrlPath: String?
    var nextUrlPath: String?
    var totalCount: Int?
    var peopleDetails: [PeopleModel]?
    
    override init() {
        super.init()
    }
    
    /// Initialization method using json data
    ///
    /// - Parameter resultArray: PeopleList object
    init(resultArray: JSON) {
        super.init()
        self.previousUrlPath = resultArray["previous"].stringValue
        self.nextUrlPath = resultArray["next"].stringValue
        self.totalCount = resultArray["count"].intValue
        var peopleList = [PeopleModel]()
        for (_,personJson):(String, JSON) in resultArray["results"] {
            let personalDetails = PeopleModel(resultArray: personJson)
            peopleList.append(personalDetails)
        }
        self.peopleDetails = peopleList
        
    }
    
    /// Method to parse the json result and update the peoplelist model array
    ///
    /// - Parameters:
    ///   - resultArray: Json result array from url fetch
    ///   - previousResultArray: Previous created Peoplelist model object
    /// - Returns: Updated peoplelist model object
    func updateFetchedResultWithPeopleListArray(resultArray: JSON, previousResultArray: PeopleListModel) -> PeopleListModel {
        let fetchedPeopleList = previousResultArray
        fetchedPeopleList.nextUrlPath = resultArray["next"].stringValue
        fetchedPeopleList.previousUrlPath = resultArray["previous"].stringValue
        for (_,personJson):(String, JSON) in resultArray["results"] {
            //self.skyDescription = subJson["description"].stringValue
            let personalDetails = PeopleModel(resultArray: personJson)
            fetchedPeopleList.peopleDetails?.append(personalDetails)
        }
        return fetchedPeopleList
    }   

}
