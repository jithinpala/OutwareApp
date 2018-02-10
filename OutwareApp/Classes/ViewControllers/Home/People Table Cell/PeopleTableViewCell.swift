//
//  PeopleTableViewCell.swift
//  OutwareApp
//
//  Created by Jithin on 8/2/18.
//  Copyright © 2018 Jithinpala. All rights reserved.
//

import UIKit

class PeopleTableViewCell: UITableViewCell {
    
    // MARK:- IBOutlet declaration
    @IBOutlet weak var peopleNameLabel: UILabel!
    @IBOutlet weak var eyeColorLabel: UILabel!
    @IBOutlet weak var genderImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    /// Method to display data in cell
    ///
    /// - Parameter dataArray: PeopleModel data model
    func cofigureCellData(dataArray: PeopleModel) {
        peopleNameLabel.text = dataArray.peopleName
        eyeColorLabel.text = dataArray.peopleEyeColor
        genderImageView.image = UIImage(named:SWHelper.getProfileImageForGender(genderType: dataArray.peopleGender!))
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
