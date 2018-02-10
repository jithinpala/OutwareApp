//
//  NetworkingAPI.swift
//  OutwareApp
//
//  Created by Jithin on 8/2/18.
//  Copyright © 2018 Jithinpala. All rights reserved.
//

import Foundation


/// HTTP request methods
///
/// - get: GET
/// - post: POST
/// - head: HEAD
/// - put: PUT
enum HTTPMethodType: String {
    case get     = "GET"
    case post    = "POST"
    case head    = "HEAD"
    case put     = "PUT"
}


class NetworkingAPI {
    
    /// API base URL
    ///
    /// - Returns: Base url as string
    class func apiBaseURL() -> String {
        return "https://swapi.co/api/"
    }
    
    ///To get people list
    ///
    /// - Returns: The URL root for People resources
    class func apiServiceForPeopleList() -> String {
        return "people"
    }
    
    /// To get planets list
    ///
    /// - Returns: The URL root for planets resources
    class func apiServiceForPlanets() -> String {
        return "planets"
    }
    
    /// To get filims list
    ///
    /// - Returns: The URL root for filims resources
    class func apiServiceForFilims() -> String {
        return "filims"
    }
    
    /// To get species list
    ///
    /// - Returns: The URL root for species resources
    class func apiServiceForSpecies() -> String {
        return "species"
    }
    
    /// To get vehicles list
    ///
    /// - Returns: The URL root for vehicles resources
    class func apiServiceForVehicles() -> String {
        return "vehicles"
    }
    
    /// To get starships list
    ///
    /// - Returns: The URL root for starships resources
    class func apiServiceForStarships() -> String {
        return "starships"
    }
}
