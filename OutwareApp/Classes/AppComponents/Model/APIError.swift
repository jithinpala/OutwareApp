//
//  APIError.swift
//  OutwareApp
//
//  Created by Jithin on 8/2/18.
//  Copyright © 2018 Jithinpala. All rights reserved.
//

import Foundation

/// The Error model class
/// This class to create custom error code and string
class APIError: Error {
    
    var errorCode: Int
    var errorString: String?
    var baseErr:Error?
    
    /// Method to initialize the error
    ///
    /// - Parameter err: Error
    init(err:Error) {
        
        self.errorCode = 0;
        self.errorString = nil;
        self.baseErr    = err;
    }
    
    /// Method to initialize the error
    ///
    /// - Parameters:
    ///   - errCode: Error code number
    ///   - errString: Error string
    ///   - err: Error description
    init(errCode:Int, errString:String, err:Error?) {
        
        self.errorCode = errCode;
        self.errorString = errString;
        self.baseErr    = err;
    }
}
