//
//  worldTableViewCell.swift
//  DeCrona
//
//  Created by Ali Maher on 7/28/20.
//  Copyright © 2020 Ali Maher. All rights reserved.
//

import UIKit

class worldTableViewCell: UITableViewCell {

    @IBOutlet weak var mainWorldView: UIView!
    
    @IBOutlet weak var totalCases: UILabel!
    @IBOutlet weak var todayCases: UILabel!
    
    @IBOutlet weak var totalDeaths: UILabel!
    
    @IBOutlet weak var todayDeaths: UILabel!
    @IBOutlet weak var totalRecoverd: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        mainWorldView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
