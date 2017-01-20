//
//  CourseCollectionViewCell.swift
//  UCL_E-Testing
//
//  Created by tom on 19.01.17.
//  Copyright © 2017 tom. All rights reserved.
//

import UIKit

class CourseCollectionViewCell: UICollectionViewCell {
    
    var courses: Courses!  {
        
        didSet {
            updateUI()
        }
    }
    
    @IBOutlet weak var courseTitle: UILabel!
    
    func updateUI () {
        //courseTitle?.text! = course.title
        
    }
    
}
