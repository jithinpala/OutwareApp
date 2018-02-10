//
//  FilterTableViewCell.swift
//  OutwareApp
//
//  Created by Jithin on 9/2/18.
//  Copyright © 2018 Jithinpala. All rights reserved.
//

import UIKit

class FilterTableViewCell: UITableViewCell {

    // MARK:- IBOutlet declaration
    @IBOutlet weak var eyeColorAndCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    /// Method to display data in cell
    ///
    /// - Parameters:
    ///   - eyeColorCount: Dictionary
    ///   - cellRow: Int
    func cofigureCellData(eyeColorCount: [String: Int], cellRow: Int) {
        if cellRow == 0 {
            eyeColorAndCountLabel.text = "See all people"
        } else {
            eyeColorAndCountLabel.text = "\(Array(eyeColorCount)[cellRow - 1].key.capitalizingFirstLetter()) (\(Array(eyeColorCount)[cellRow - 1].value))"
        }
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
