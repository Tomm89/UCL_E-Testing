//
//  ResultsViewController.swift
//  UCL_E-Testing
//
//  Created by tom on 16.01.17.
//  Copyright © 2017 tom. All rights reserved.
//

import UIKit
import PieCharts


class ResultsViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var chartView: PieChart!
   
    var numberToDisplay = 0


    override func viewDidLoad() {
        super.viewDidLoad()
        
        chartView.models = [PieSliceModel(value: 1.7, color: UIColor.white),
                            PieSliceModel(value: 0.3, color: UIColor.clear)]

        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.png")!)
        self.view.contentMode = UIViewContentMode.scaleAspectFill //doesnt seem to do anything!
        self.view.clipsToBounds = true
        self.view.center = view.center
        
        

        // Do any additional setup after loading the view.
    }
    
}
