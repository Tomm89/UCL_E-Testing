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

class TestsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var greenView: UIView!
    
    
    var questions = [Questions]()

    var answers = [Answers]()
    
    var ref: FIRDatabaseReference!
    //var databaseHandler: FIRDatabaseHandle?
    var refHandle: UInt!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.png")!)
        self.view.contentMode = UIViewContentMode.scaleAspectFill //doesnt seem to do anything!
        self.view.clipsToBounds = true
        self.view.center = view.center
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        self.textView.text = ""
        

        ref = FIRDatabase.database().reference()
        fetchAnswers()
        fetchQuestions()
        
    }
    
/*    func loadSampleAnswers() {
        
        var sampleAnswers: Answers
        
        for x in 0...answersArray.count-1 {
            sampleAnswers = Answers(name: answersArray[x])
            answers.append(sampleAnswers)
        }
    }  */
    
    
    func tapped(){
        greenView.removeFromSuperview()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return answers.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "answers", for: indexPath as IndexPath) as! MyAnswers
        
        cell.myCheckImage.isHidden = false
        
        //getting the index path of selected row
        let indexPath = tableView.indexPathForSelectedRow
        
        //getting the current cell from the index path
        let currentCell = tableView.cellForRow(at: indexPath!)! as UITableViewCell
        
        //getting the text of that cell
        let currentItem = currentCell.textLabel!.text
        
        let alertController = UIAlertController(title: "Odpověděl/a jste správně", message: "Je vybráno " + currentItem! , preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Pokračovat", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "answers")   //tableView.dequeueReusableCell(withIdentifier: "answers", for: indexPath as IndexPath)
        
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
    
    func fetchQuestions() {
        self.refHandle = ref.child("Questions").observe(.childAdded, with: { (snapshot) in
            if let Dictionary = snapshot.value as? [String: AnyObject] {
                
                print(Dictionary)
                
                let question = Questions()
                
                question.setValuesForKeys(Dictionary)
                self.questions.append(question)
                DispatchQueue.main.async {
                    self.textView.text = self.questions[0].name
                }
                
            }
        })
    }

}
