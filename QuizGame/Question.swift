//
//  Question.swift
//  QuizGame
//
//  Created by Landon McKell on 6/21/18.
//  Copyright © 2018 John Hancock. All rights reserved.
//

import Foundation


class Question {
    var category: String
    var difficulty: String
    var correctAnswer: String
    var incorrectAnswer: [String]
    
    init(category: String, difficulty: String, correctAnswer: String, incorrectAnswer: [String]) {
        self.category = category
        self.correctAnswer = correctAnswer
        self.difficulty = difficulty
        self.incorrectAnswer = incorrectAnswer
    }
    
    
}
