//
//  SWPeopleListViewController.swift
//  OutwareApp
//
//  Created by Jithin on 8/2/18.
//  Copyright © 2018 Jithinpala. All rights reserved.
//

import UIKit


class SWPeopleListViewController: UIViewController {

    // MARK:- IBOutlet declaration
    @IBOutlet weak var peopleListTableView: UITableView!
    @IBOutlet weak var controllerHeaderBar: UIView!
    
    // MARK:- variable declaraion
    var peopleListArray =  PeopleListModel()
    var isFilterApplied: Bool = false
    var filterAppliedArray = [PeopleModel]()
    var filterEyeColor: String = ""
    var waringLabel: UILabel!
    
    /// ViewDidLoad method
    override func viewDidLoad() {
        super.viewDidLoad()
        self.customizeAppearance()
    }
    
    
    /// ViewWillApper method
    ///
    /// - Parameter animated: true or false
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.fetchPeopleList()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }  

}


// MARK:- TableView Delegate and DataSource
extension SWPeopleListViewController: UITableViewDelegate, UITableViewDataSource {
    
    /// Tableview section
    ///
    /// - Parameter tableView: UITableView
    /// - Returns: section cout as Int
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    /// Number of row in section
    ///
    /// - Parameters:
    ///   - tableView: UITableView
    ///   - section: section number as Int
    /// - Returns: number of rows as Int
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let tableCount =  peopleListArray.peopleDetails?.count else {
            return 0
        }
        if isFilterApplied {
            return filterAppliedArray.count
        }
        return tableCount
    }
    
    
    /// Create tableview cell and declare cell details
    ///
    /// - Parameters:
    ///   - tableView: UITableView
    ///   - indexPath: Indexpath for the cell
    /// - Returns: UITableViewCell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PeopleTableViewCell") as! PeopleTableViewCell
        let singlePeopleDetails = isFilterApplied ? filterAppliedArray[indexPath.row] : peopleListArray.peopleDetails![indexPath.row]
        cell.cofigureCellData(dataArray: singlePeopleDetails)
        
        return cell
        
    }    

    
}

// MARK:- Outlet Actions and Methods
extension SWPeopleListViewController {
    
    /// Filter button tap action method
    ///
    /// - Parameter sender: UIButton as sender
    @IBAction func filterButtonTapAction(sender: UIButton) {
        guard let peopleDetails = peopleListArray.peopleDetails else {
            SWAlert.ShowSimpleAlert(withMessage: "Alert.people.list.empty".localized(), inController: self)
            return
        }
        let filterViewController = FilterViewController.getController()
        filterViewController.delegate = self
        filterViewController.peopleListArray = peopleDetails
        filterViewController.modalTransitionStyle = .crossDissolve
        filterViewController.modalPresentationStyle = .overCurrentContext
        self.present(filterViewController, animated: true, completion: nil)
    }
    
    /// To customize the UI appearance of VC
    func customizeAppearance() {
        controllerHeaderBar.backgroundColor = UIColor.appThemeBlueColor()
    }
    
    /// Method to show warning about nectwork connection
    func showWaringLabel() {
        waringLabel = UILabel()
        waringLabel.frame = CGRect(x: 15, y: (peopleListTableView.frame.size.height / 2) - 30, width: peopleListTableView.frame.size.width - 30, height: 60)
        waringLabel.backgroundColor = UIColor.clear
        waringLabel.numberOfLines = 0
        waringLabel.textColor = UIColor.black
        waringLabel.text = "Label.warning.message".localized()
        waringLabel.textAlignment = NSTextAlignment.center
        waringLabel.font = UIFont(name: "Helvetica", size: 25.0)
        self.peopleListTableView.addSubview(waringLabel)
    }
    
    /// Method to remove warning
    func removeWaringFromParentView() {
        guard (waringLabel != nil) else {
            return
        }
        if self.waringLabel.isDescendant(of: self.peopleListTableView) {
            self.waringLabel.removeFromSuperview()
        }
    }
    
}

// MARK:- Webservice call
extension SWPeopleListViewController {
    
    /// Method to fetch people list and this methos is the fisrt call
    func fetchPeopleList() {
        SWProgressHUD.sharedInstance.showHUDWithMessage(message: "Progress.hud.loading".localized())
        PeopleListServiceManager.sharedInstance.fetchPeopleListFromServerCall(success: { (resultArray) in
            SWProgressHUD.sharedInstance.hideHUD()
            self.removeWaringFromParentView()
            self.peopleListArray = resultArray!
            self.peopleListTableView.reloadData()
        }) { (appError) in
            SWProgressHUD.sharedInstance.hideHUD()
            self.showWaringLabel()
            if (appError?.errorCode)! > 0 {
                SWAlert.ShowSimpleAlertWithHandler(withMessage: (appError?.errorString)!, inController: self, completionHandler: { (finished) in
                    
                })
            }
            SWAlert.ShowSimpleAlert(withMessage: "Alert.webservice.failure".localized(), inController: self)
            
        }
    }
    
    /// Method to fetch people details and this use as tableview loadmore call
    func fetchLoadMorePeopleList() {
        PeopleListServiceManager.sharedInstance.fetchMorePeopleListFromServer(resultArray: peopleListArray, success: { (fetchedResult) in
            if self.isFilterApplied {
                self.filterAppliedArray = (self.peopleListArray.peopleDetails?.filter({$0.peopleEyeColor == self.filterEyeColor}))!
            }
            self.peopleListTableView.hideLoadingFooter()
            self.peopleListTableView.reloadData()
        }) { (appError) in
            self.peopleListTableView.hideLoadingFooter()
            SWAlert.ShowSimpleAlert(withMessage: "Alert.webservice.failure".localized(), inController: self)
        }
    }
    
}

// MARK:- ScrollView Delegate
extension SWPeopleListViewController: UIScrollViewDelegate {    
    
    /// ScrollView did scroll method
    ///
    /// - Parameter scrollView: UIScrollView as param
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard !(peopleListArray.peopleDetails?.count == peopleListArray.totalCount) else {
            return
        }
        guard !isFilterApplied else {
            return
        }
        let contentLarger = (scrollView.contentSize.height > scrollView.frame.size.height)
        let viewableHeight = contentLarger ? scrollView.frame.size.height : scrollView.contentSize.height
        let atBottom = (scrollView.contentOffset.y >= scrollView.contentSize.height - viewableHeight + 50)
        if atBottom && !peopleListTableView.isLoadingFooterShowing() {
            self.peopleListTableView.showLoadingFooter()
            self.fetchLoadMorePeopleList()
        }
    }
}

// MARK:- FilterViewController Delegate
extension SWPeopleListViewController: FilterViewDelegate { 
    
    /// FilterViewController cell tap
    ///
    /// - Parameters:
    ///   - slectedEyeColor: selected eye color as string
    ///   - isClickOnEyeColor: Bool value to check eye color click or sell all people
    func filterTapAction(slectedEyeColor: String, isClickOnEyeColor: Bool) {
        if isClickOnEyeColor {
            isFilterApplied = isClickOnEyeColor
            filterEyeColor = slectedEyeColor
            filterAppliedArray = (peopleListArray.peopleDetails?.filter({$0.peopleEyeColor == slectedEyeColor}))!
        } else {
            isFilterApplied = isClickOnEyeColor
        }
        self.peopleListTableView.reloadData()        
        self.peopleListTableView.setContentOffset(.zero, animated: true)
    }
}

