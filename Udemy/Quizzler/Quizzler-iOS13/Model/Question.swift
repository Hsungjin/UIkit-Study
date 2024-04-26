//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by 황성진 on 4/27/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let questionText: String
    let answer: String
    
    init(q: String, a: String) {
        questionText = q
        answer = a
    }
}
