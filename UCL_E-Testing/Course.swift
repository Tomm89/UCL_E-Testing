//
//  Course.swift
//  UCL_E-Testing
//
//  Created by tom on 19.01.17.
//  Copyright © 2017 tom. All rights reserved.
//

import UIKit

class Course {
    
    var numberOfCourses: String
    var title: String
    var text: String
    
    init(numberOfCourses: String, title: String, text: String) {
        self.numberOfCourses = numberOfCourses
        self.title = title
        self.text = text
    }
    
    static func createCourses() -> [Course] {
        
        return [
            Course(numberOfCourses: "1/10", title: "Název kurzu", text: "Charakteristickou vlastností matematiky je její důraz na absolutní přesnost metod a nezpochybnitelnost výsledků. Tyto vlastnosti, které matematiku odlišují od všech ostatních vědních disciplín, mají původ již v antickém Řecku."),
            Course(numberOfCourses: "2/10", title: "Název kurzu", text: "Charakteristickou vlastností matematiky je její důraz na absolutní přesnost metod a nezpochybnitelnost výsledků. Tyto vlastnosti, které matematiku odlišují od všech ostatních vědních disciplín, mají původ již v antickém Řecku."),
            Course(numberOfCourses: "3/10", title: "Název kurzu", text: "Charakteristickou vlastností matematiky je její důraz na absolutní přesnost metod a nezpochybnitelnost výsledků. Tyto vlastnosti, které matematiku odlišují od všech ostatních vědních disciplín, mají původ již v antickém Řecku."),
            Course(numberOfCourses: "4/10", title: "Název kurzu", text: "Charakteristickou vlastností matematiky je její důraz na absolutní přesnost metod a nezpochybnitelnost výsledků. Tyto vlastnosti, které matematiku odlišují od všech ostatních vědních disciplín, mají původ již v antickém Řecku."),
            Course(numberOfCourses: "5/10", title: "Název kurzu", text: "Charakteristickou vlastností matematiky je její důraz na absolutní přesnost metod a nezpochybnitelnost výsledků. Tyto vlastnosti, které matematiku odlišují od všech ostatních vědních disciplín, mají původ již v antickém Řecku."),
        ]
    }
    
    
}
