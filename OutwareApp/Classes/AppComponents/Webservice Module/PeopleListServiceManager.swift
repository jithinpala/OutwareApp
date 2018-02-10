
//
//  PeopleListServiceManager.swift
//  OutwareApp
//
//  Created by Jithin on 8/2/18.
//  Copyright © 2018 Jithinpala. All rights reserved.
//

import Foundation
import SwiftyJSON

class PeopleListServiceManager {
    
    /// Singleton instance
    static let sharedInstance = PeopleListServiceManager()
    
    /// Method to fetch people list from the url
    ///
    /// - Parameters:
    ///   - success: success call back handler
    ///   - failure: failure call back handler
    func fetchPeopleListFromServerCall(success: @escaping (_ result: PeopleListModel?) -> Void, failure: @escaping (_ error: APIError?) -> Void ) {
        let serviceManager = WebserviceServerManager.sharedServerManager
        let serviceURL = NetworkingAPI.apiBaseURL() + NetworkingAPI.apiServiceForPeopleList()
        serviceManager.sendRequestToServer(apiServiceFullURL: serviceURL, parameters: nil, apiRequestType: .get, success: { (response) in
            let fetchedResults = PeopleListModel(resultArray: response)
            success(fetchedResults)
        }) { (apiError) in
            failure(apiError)
        }
    }
    
    /// Method to fetch people list from the url and use when table load more call
    ///
    /// - Parameters:
    ///   - resultArray: Current fetched people list
    ///   - success: success call back handler
    ///   - failure: failure call back handler
    func fetchMorePeopleListFromServer(resultArray: PeopleListModel, success: @escaping (_ result: PeopleListModel?) -> Void, failure: @escaping (_ error: APIError?) -> Void) {
        let serviceManager = WebserviceServerManager.sharedServerManager
        let serviceURL = resultArray.nextUrlPath!
        serviceManager.sendRequestToServer(apiServiceFullURL: serviceURL, parameters: nil, apiRequestType: .get, success: { (response) in
            let fetchedResults = resultArray.updateFetchedResultWithPeopleListArray(resultArray: response, previousResultArray: resultArray)
            success(fetchedResults)            
        }) { (apiError) in
            failure(apiError)
        }
    }
    
}
