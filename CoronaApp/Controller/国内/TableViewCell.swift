//
//  TableViewCell.swift
//  CoronaApp
//
//  Created by 吉田俊太郎 on 2020/05/21.
//  Copyright © 2020 Shuntaro Yoshida. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class TableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var casesLabel: UILabel!
    @IBOutlet weak var deathsLabel: UILabel!
    
    @IBOutlet weak var casesChangeLabel: UILabel!
    @IBOutlet weak var deathsChangeLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
        
        // Configure the view for the selected state
    }
    
}
