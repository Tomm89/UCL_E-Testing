//
//  Login.swift
//  UCL_E-Testing
//
//  Created by tom on 18.01.17.
//  Copyright © 2017 tom. All rights reserved.
//

import UIKit

class Login: UIViewController {

    @GKInspectable weak var cornerRadius: UIView!
    
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cornerRadius.layer.cornerRadius = 8
        self.cornerRadius.layer.masksToBounds = true
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.png")!)
        self.view.contentMode = UIViewContentMode.scaleAspectFill //doesnt seem to do anything!
        self.view.clipsToBounds = true
        self.view.center = view.center
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        button.backgroundColor = UIColor.clear
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 2
        self.button.layer.borderColor = UIColor(red:49/255.0, green:177/255.0, blue:221/255.0, alpha: 1.0).cgColor

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
