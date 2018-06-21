//
//  Question.swift
//  QuizGame
//
//  Created by Landon McKell on 6/21/18.
//  Copyright © 2018 John Hancock. All rights reserved.
//

import Foundation

struct TopLevelData {
    var results: [Question]
}

struct Question: Codable {
    var category: String
    var difficulty: String
    var correctAnswer: String
    var incorrectAnswer: [String]
    
    enum CodingKeys: CodingKey, String {
        case category
        case difficulty
        case correctAnswer = "correct_answer"
        case incorrectAnswer = "incorrect_answer"
    }
}
