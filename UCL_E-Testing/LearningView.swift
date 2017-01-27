//
//  LearningView.swift
//  UCL_E-Testing
//
//  Created by tom on 18.01.17.
//  Copyright © 2017 tom. All rights reserved.
//

import UIKit
import iCarousel

class LearningView: UIViewController, iCarouselDataSource, iCarouselDelegate {
    
    
    @IBOutlet weak var carousel: iCarousel!
    @IBOutlet weak var profile: UIView!
    @IBOutlet weak var textForCarousel: UITextView!
    
    
    var subjects = [Subject]()
    var courses = [Courses]()
    var items: [String] = ["Číselné obory, zobrazení, funkce", "Integrály", "Matice", "Ntice", "Faktoriál"]
    
    var texts = [Texts]()
    var text: [String] = ["Toto je zkušební text do textového pole v caruselu. Uvidíme, jak se bude zobrazovat. Ať žije programování pro iOS!", "Toto je zkušební text do textového pole v caruselu. Uvidíme, jak se bude zobrazovat. Ať žije programování pro iOS!", "Toto je zkušební text do textového pole v caruselu. Uvidíme, jak se bude zobrazovat. Ať žije programování pro iOS!" ]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.png")!)
        self.view.contentMode = UIViewContentMode.scaleAspectFill //doesnt seem to do anything!
        self.view.clipsToBounds = true
        self.view.center = view.center
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        self.carousel.layer.cornerRadius = 10
        //self.profile.layer.cornerRadius = 35
        
        //self.navigationItem.title = subjects[1].name
        
        carousel.type = .coverFlow
       // loadItems()
      //  loadtext()
        
    }
    
        // Do any additional setup after loading the view.
    
  /*  func loadItems() {
        
        var samples: Courses
        
        for x in 0...items.count-1 {
            samples = Courses(name: items[x])
            courses.append(samples)
        }
    }
    
    func loadtext() {
        
        var samples : Texts
        
        for x in 0...text.count-1 {
            samples = Texts(name: text[x])
            texts.append(samples)
        }
        
        
    }  */
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return items.count //+text.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        
        var label: UILabel
        var tempView: UIImageView
        
       if let view = view as? UIImageView {
            tempView = view
            //get a reference to the label in the recycled view
            label = tempView.viewWithTag(1) as! UILabel
            //profile = tempView.viewWithTag(1) as UIView!
           // text = tempView.viewWithTag(1) as! UITextView
        
        } else {
        tempView = UIImageView(frame: CGRect(x: 20, y: 0, width: 300, height: 425))
        tempView.backgroundColor = UIColor.white
        tempView.contentMode = .center
        tempView.layer.cornerRadius = 10
        
        label = UILabel(frame: tempView.bounds)
        label.backgroundColor = UIColor.clear
        label.textAlignment = .center
        label.font = label.font.withSize(18)
        label.tag = 1
        
        textForCarousel = UITextView(frame: tempView.bounds)
        textForCarousel.backgroundColor = UIColor.clear
        textForCarousel.textAlignment = .center
        textForCarousel.tag = 1
        
        //profile = UIView(frame: tempView.bounds)
        profile.layer.cornerRadius = 35
        //profile.tag = 1
        
        tempView.addSubview(label)
        tempView.addSubview(profile)
        //tempView.addSubview(textForCarousel)
        
        }
        
        //textForCarousel.text = "\(text)"
        label.text = "\(items[index])"
        
        return tempView
    }
    
    func carousel (_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
        
        if option == iCarouselOption.spacing {
            print(value)
            return value * 1.1
        }
        return value
    }
    
    func carousel(_ carousel: iCarousel, didSelectItemAt index: Int) {
        let item = self.items[index]
        print(item)
    }

}
