//
//  HeaderView.swift
//  UCL_E-Testing
//
//  Created by tom on 02.02.17.
//  Copyright © 2017 tom. All rights reserved.
//

import UIKit

class HeaderView: UITableViewCell {

    @IBOutlet var picture: UIImageView!
    @IBOutlet var headerLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
