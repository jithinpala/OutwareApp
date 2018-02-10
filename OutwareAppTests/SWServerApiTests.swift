//
//  SWServerApiTests.swift
//  OutwareAppTests
//
//  Created by Jithin on 9/2/18.
//  Copyright © 2018 Jithinpala. All rights reserved.
//

import XCTest
import SwiftyJSON
@testable import OutwareApp

class SWServerApiTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPeopleFetchRequest() {
        let URLpath = NetworkingAPI.apiBaseURL() + NetworkingAPI.apiServiceForPeopleList()
        let expectationComment = expectation(description: "GET data from \(URLpath)")
        WebserviceServerManager.sharedServerManager.sendRequestToServer(apiServiceFullURL: URLpath, parameters: nil, apiRequestType: .get, success: { (resultJSON) in
            //XCTAssert(resultJSON is JSON, "Confirm result is object of JSON")
            let fetchedResults = PeopleListModel(resultArray: resultJSON)
            XCTAssertEqual(fetchedResults.peopleDetails?.count, 10, "Checking people count in model")
            expectationComment.fulfill()
        }) { (ApiError) in
            print("failure")
            XCTFail()
        }
        waitForExpectations(timeout: 10) { (error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
