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
        
        button.backgroundColor = UIColor.clear
        button.layer.cornerRadius = 25
        button.layer.borderWidth = 2
        self.button.layer.borderColor = UIColor(red:49/255.0, green:177/255.0, blue:221/255.0, alpha: 1.0).cgColor

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func Exit(_ sender: Any) {
        exit(0)
    }
}
