//
//  CollectionViewController.swift
//  UCL_E-Testing
//
//  Created by tom on 19.01.17.
//  Copyright © 2017 tom. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet var profile1: UIView!
    @IBOutlet weak var courseCell: UICollectionViewCell!
    
    
    // UICollectionViewDataSource
    var course = Course.createCourses()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.png")!)
        self.view.contentMode = UIViewContentMode.scaleAspectFill //doesnt seem to do anything!
        self.view.clipsToBounds = true
        self.view.center = view.center
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        //self.profile1.layer.cornerRadius = 30
        //self.collectionCell.layer.cornerRadius = 8
        

        // Do any additional setup after loading the view.
    }
    
    struct Storyboard {
        static let CellIdentifier = "Course Cell"
    }

    
}

extension CollectionViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return course.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.CellIdentifier, for: indexPath as IndexPath)
        
       
        return cell
    }
    
}
