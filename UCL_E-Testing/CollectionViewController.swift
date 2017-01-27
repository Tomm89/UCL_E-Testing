//
//  CollectionViewController.swift
//  UCL_E-Testing
//
//  Created by tom on 19.01.17.
//  Copyright © 2017 tom. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class CollectionViewController: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet var profile1: UIView!
    @IBOutlet weak var courseCell: UICollectionViewCell!

    
    var subjects = [Courses]()
    
    // UICollectionViewDataSource
    var course = Course.createCourses()
    var refHandle: UInt!
    var ref: FIRDatabaseReference!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.png")!)
        self.view.contentMode = UIViewContentMode.scaleAspectFill //doesnt seem to do anything!
        self.view.clipsToBounds = true
        self.view.center = view.center
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(CollectionViewController.handleTap(_:)))
        recognizer.numberOfTapsRequired = 1
        collectionView.addGestureRecognizer(recognizer)
        collectionView.isUserInteractionEnabled = true
        
        ref = FIRDatabase.database().reference()
        
        fetchSubjects()
        //handleTap()
        
        //self.profile1.layer.cornerRadius = 30
        //self.collectionCell.layer.cornerRadius = 8
        

        // Do any additional setup after loading the view.
    }
    
    struct Storyboard {
        static let CellIdentifier = "Course Cell"
    }
    
    
    func handleTap(_ sender: UITapGestureRecognizer) {
        print("Hello World")
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let secondViewController = storyBoard.instantiateViewController(withIdentifier: "secondView") as! TestsViewController
        self.present(secondViewController, animated:true, completion:nil)
    }
    
    
    func fetchSubjects() {
        self.refHandle = ref.child("Subjects").observe(.childAdded, with: { (snapshot) in
            if let Dictionary = snapshot.value as? [String: AnyObject] {
                
                print(Dictionary)
                
                let subjects = Courses()
                
                subjects.setValuesForKeys(Dictionary)
                self.subjects.append(subjects)
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }

                
            }
        })
    }

    
}

extension CollectionViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return subjects.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.CellIdentifier, for: indexPath as IndexPath) as! CourseCollectionViewCell
        
        cell.courseTitle?.text = subjects[indexPath.row].name
        cell.labelText?.text = subjects[indexPath.row].text
        
        return cell
    }
    
}
