//
//  DeathTableViewCell.swift
//  D02
//
//  Created by Arthur DUBEDAT on 3/28/18.
//  Copyright © 2018 Arthur DUBEDAT. All rights reserved.
//

import UIKit

class DeathTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var deathCell : (String, String?, Date)? {
        didSet {
            if let f = deathCell {
                nameLabel.text = f.0
                descriptionLabel.text = f.1
                dateLabel.text = f.2.description
            }
        }
    }
}
