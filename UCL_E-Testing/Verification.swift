//
//  Verification.swift
//  UCL_E-Testing
//
//  Created by tom on 18.01.17.
//  Copyright © 2017 tom. All rights reserved.
//

import Foundation
import UIKit

class VerificationConroller: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var numberToDisplay = 0
    
    var answers = [Answers]()
    var answersArray: [String] = ["Odpověď 1", "Odpověď 2", "Odpověď 3", "Odpověď 4"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.png")!)
        self.view.contentMode = UIViewContentMode.scaleAspectFill //doesnt seem to do anything!
        self.view.clipsToBounds = true
        self.view.center = view.center
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        loadSampleAnswers()
        
        // Do any additional setup after loading the view.
    }
    
    func loadSampleAnswers() {
        
        var sampleAnswers: Answers
        
        for x in 0...answersArray.count-1 {
            sampleAnswers = Answers(name: answersArray[x])
            answers.append(sampleAnswers)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        tableView.reloadData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.answers.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "answers", for: indexPath as IndexPath) as! MyAnswers
        
        cell.myCheckImage.accessibilityElementsHidden = false
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "answers", for: indexPath as IndexPath) as! MyAnswers
        
        let answers = self.answers[indexPath.row]
        cell.Label?.text = answers.name
        
        return cell
    }
    
}
