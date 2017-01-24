//
//  TestsViewController.swift
//  UCL_E-Testing
//
//  Created by tom on 16.01.17.
//  Copyright © 2017 tom. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase

class TestsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    //var numberToDisplay = 0
    
    var answers = [Answers]()
    //var answersArray = [String]() //= ["Odpověď 1", "Odpověď 2", "Odpověď 3", "Odpověď 4"]
    
    var ref: FIRDatabaseReference!
    var databaseHandler: FIRDatabaseHandle?
    var refHandle: UInt!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.png")!)
        self.view.contentMode = UIViewContentMode.scaleAspectFill //doesnt seem to do anything!
        self.view.clipsToBounds = true
        self.view.center = view.center
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
       // loadSampleAnswers()
        
        ref = FIRDatabase.database().reference()
        
        fetchAnswers()

        
        // "events" is the root, and "title" is the key for the data I wanted to build an array with.
       
      /*  let answerRef = self.ref.child("Anawers")
        answerRef.queryOrdered(byChild: "Answer1").observe(.childAdded, with: { (snapshot) in
            
            if let dictionary = snapshot.value as? String {
                self.answersArray.append(dictionary)
                
                // Double-check that the correct data is being pulled by printing to the console.
                print("\(self.answersArray)")
                
                // async download so need to reload the table that this data feeds into.
                self.tableView.reloadData()
            }
        }) */
        
    }
    
/*    func loadSampleAnswers() {
        
        var sampleAnswers: Answers
        
        for x in 0...answersArray.count-1 {
            sampleAnswers = Answers(name: answersArray[x])
            answers.append(sampleAnswers)
        }
    }  */
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return answers.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "answers", for: indexPath as IndexPath) as! MyAnswers
        
        //cell.myCheckImage.accessibilityElementsHidden = false
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "answers")   //tableView.dequeueReusableCell(withIdentifier: "answers", for: indexPath as IndexPath)
        
        //let answers = self.answers[indexPath.row]
        
        //cell.textLabel?.text = answers[indexPath.row].provider
        cell.textLabel?.text = answers[indexPath.row].name
        return cell
    }
    
    func fetchAnswers() {
        refHandle = ref.child("Answers").observe(.childAdded, with: { (snapshot) in
            if let Dictionary = snapshot.value as? [String: AnyObject] {
                
                print(Dictionary)
                
                let answer = Answers()
                
                answer.setValuesForKeys(Dictionary)
                self.answers.append(answer)
                
                DispatchQueue.main.async {
                self.tableView.reloadData()
                }
            }
        })
    }

}
