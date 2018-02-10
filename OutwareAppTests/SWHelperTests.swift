//
//  SWHelperTests.swift
//  OutwareAppTests
//
//  Created by Jithin on 9/2/18.
//  Copyright © 2018 Jithinpala. All rights reserved.
//

import XCTest
@testable import OutwareApp

class SWHelperTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testForGettingPeopleGender() {        
        let result = SWHelper.getProfileImageForGender(genderType: PeopleGender.male)
        XCTAssert(result == "Male", "Test failed - Value returned is not the expected")
    }
    
    func testEyeColorAndCount() {
        var peopleModel = [PeopleModel]()
        let inputArray = ["red", "blue", "yellow", "blue-gray", "red", "brown", "blue", "brown", "yellow", "blue",]
        let outputArray = ["red": 2, "blue": 3, "brown": 2, "blue-gray": 1, "yellow": 2]
        for item in inputArray {
            let model = PeopleModel()
            model.peopleEyeColor = item
            peopleModel.append(model)
        }
        let result = SWHelper.getTheCountForEyeColor(peopleListArray: peopleModel)
        XCTAssert((result as Any) is [String: Int], "Dictionay formatt is not correct")
        XCTAssert(result == outputArray, "Method not working")
        XCTAssertEqual(result.count, 5, "Checking the result count")
    }
    
    func testLocalizedStringConversion() {
        let resultString = "Progress.hud.loading".localized()
        XCTAssert(resultString == "Loading...", "Method not working")
    }
    
    func testStringFirstCharacterCap() {
        let resultString = "jithin balan".capitalizingFirstLetter()
        XCTAssert(resultString == "Jithin balan", "Method not working and string first character is not caps")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
