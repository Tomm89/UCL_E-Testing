//
//  MyTableViewCell.swift
//  UCL_E-Testing
//
//  Created by tom on 16.01.17.
//  Copyright © 2017 tom. All rights reserved.
//

import UIKit


class MyTableViewCell: UITableViewCell {
    

    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var testsButton: UIButton!
    @IBOutlet weak var resultsButton: UIButton!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
