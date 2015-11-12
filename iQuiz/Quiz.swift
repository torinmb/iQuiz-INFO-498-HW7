//
//  Question.swift
//  iQuiz
//
//  Created by Weschler, Sabrina on 11/6/15.
//  Copyright (c) 2015 Adobe. All rights reserved.
//

import Foundation


class Quiz {
    var title: String = ""
    var description: String = ""
    var questions : [Question]
    
    convenience init() {
        self.init(title: "", description: "", questions : [])
    }
    
    init(title: String, description: String, questions : [Question]) {
        self.title = title
        self.description = description
        self.questions = questions
    }
    
}