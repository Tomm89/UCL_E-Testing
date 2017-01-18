//
//  ViewController.swift
//  UCL_E-Testing
//
//  Created by tom on 15.01.17.
//  Copyright © 2017 tom. All rights reserved.
//

import UIKit
import Foundation
import Firebase


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func course(sender: UIButton) {
        _ = sender.tag
    }

    
    var subjects = [Subject]()
    var array: [String] = ["Matematika", "Lineární algebra", "Alogritmy", "Programování", "Java", "C#", "C++"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        tableView.backgroundColor = UIColor.clear
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.png")!)
        self.view.contentMode = UIViewContentMode.scaleAspectFill //doesnt seem to do anything!
        self.view.clipsToBounds = true
        self.view.center = view.center
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        loadSampleSubjects()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
     func numberOfSections(in tableView: UITableView) -> Int {
     return 1
     }
    
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subjects.count
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath as IndexPath) as! MyTableViewCell

        cell.backgroundColor = UIColor(white: 1, alpha: 0.5)

        let subject = subjects[indexPath.row]
        
        // set the text from the data model
        //cell.textLabel?.text = subjects[indexPath.row].name
        
        cell.testsButton?.tag = indexPath.row
        cell.subjectLabel?.text = subject.name
        
        return cell
    }
    
    func loadSampleSubjects() {
        
        var subjectTemp: Subject
        
        for x in 0...array.count-1 {
            subjectTemp = Subject(name: array[x])
            subjects.append(subjectTemp)
        }
    }
    
    @IBAction func Exit(_ sender: Any) {
        exit(0)
    }
    
}
