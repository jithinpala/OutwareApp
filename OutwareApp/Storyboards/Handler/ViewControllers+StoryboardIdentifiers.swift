//
//  ViewControllers+StoryboardIdentifiers.swift
//  OutwareApp
//
//  Created by Jithin on 8/2/18.
//  Copyright © 2018 Jithinpala. All rights reserved.
//

import Foundation
import UIKit

extension SWPeopleListViewController: StoryboardIdentifiable {
    
    class func getController() -> SWPeopleListViewController {
        return SWPeopleListViewController.instantiateViewControllerFromStoryboard(UIStoryboard.homeStoryboard()) as! SWPeopleListViewController
    }
    
    class func storyboardIdentifier() -> String {
        return "SWPeopleListViewController"
    }
    
}

extension FilterViewController: StoryboardIdentifiable {
    
    class func getController() -> FilterViewController {
        return FilterViewController.instantiateViewControllerFromStoryboard(UIStoryboard.homeStoryboard()) as! FilterViewController
    }
    
    class func storyboardIdentifier() -> String {
        return "FilterViewController"
    }
    
}

