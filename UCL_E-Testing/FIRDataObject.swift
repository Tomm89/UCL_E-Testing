//
//  FIRDataObject.swift
//  UCL_E-Testing
//
//  Created by tom on 24.01.17.
//  Copyright © 2017 tom. All rights reserved.
//

import UIKit
import Firebase

class FIRDataObject: NSObject {

    let snapshot: FIRDataSnapshot
    var key: String { return snapshot.key }
    var ref: FIRDatabaseReference { return snapshot.ref }
    
    required init(snapshot: FIRDataSnapshot) {
        
        self.snapshot = snapshot
        
        super.init()
        
        for child in snapshot.children.allObjects as? [FIRDataSnapshot] ?? [] {
            if responds(to: Selector(child.key)) {
                setValue(child.value, forKey: child.key)
            }
        }
    }
    
}
