//
//  FilterViewController.swift
//  OutwareApp
//
//  Created by Jithin on 9/2/18.
//  Copyright © 2018 Jithinpala. All rights reserved.
//

import UIKit

protocol FilterViewDelegate: class {
    func filterTapAction(slectedEyeColor: String, isClickOnEyeColor: Bool)
}

class FilterViewController: UIViewController {

    
    // MARK:- IBOutlet declaration
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var containerHeaderView: UIView!
    @IBOutlet weak var filterListTableView: UITableView!
    
    // MARK:- variable declaraion
    var peopleListArray =  [PeopleModel]()
    var eyeColorList: [String: Int] = [:]
    weak var delegate: FilterViewDelegate?
    
    /// ViewDidiLoad method
    override func viewDidLoad() {
        super.viewDidLoad()        
        // Do any additional setup after loading the view.
        self.customizeAppearance()
        eyeColorList = SWHelper.getTheCountForEyeColor(peopleListArray: peopleListArray)
    }
    
    /// Viewwillapper method
    ///
    /// - Parameter animated: Bool
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

// MARK:- Customize appearance
extension FilterViewController {
    
    /// Method to customize the appearance of the controller
    func customizeAppearance() {
        self.view.backgroundColor = UIColor.appThemeBlueColor().withAlphaComponent(0.7)
        containerView.layer.masksToBounds = true
        containerView.layer.cornerRadius = 10.0
        
    }
}

// MARK:- TableView Delegate and DataSource
extension FilterViewController: UITableViewDelegate, UITableViewDataSource {
    
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
        return eyeColorList.count + 1
    }
    
    
    /// Create tableview cell and declare cell details
    ///
    /// - Parameters:
    ///   - tableView: UITableView
    ///   - indexPath: Indexpath for the cell
    /// - Returns: UITableViewCell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilterTableViewCell") as! FilterTableViewCell
        cell.cofigureCellData(eyeColorCount: eyeColorList, cellRow: indexPath.row)        
        return cell
        
    }
    
    /// TableView didselect row
    ///
    /// - Parameters:
    ///   - tableView: UITableView
    ///   - indexPath: indexpath of selected row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
        }        
        delegate?.filterTapAction(slectedEyeColor: indexPath.row == 0 ? "First" : (Array(eyeColorList)[indexPath.row - 1].key), isClickOnEyeColor: indexPath.row == 0 ? false : true)
    }
    
    
}

// MARK:- Outlet action methods
extension FilterViewController {
    
    /// Close button tap action and call delegate
    ///
    /// - Parameter sender: UIButton as param
    @IBAction func closeButtonTapAction(sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
