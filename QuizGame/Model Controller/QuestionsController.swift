//
//  QuestionsController.swift
//  QuizGame
//
//  Created by Landon McKell on 6/21/18.
//  Copyright © 2018 John Hancock. All rights reserved.
//

import Foundation

class QuestionsController {
    
    struct Constants {
        static let baseURL = URL(string: "https://opentdb.com/")
        static let amountLimit = 15
    }
    
    static var questions: [Question]? = [Question]()
    
    static func fetchQuizQuestionsWith(string: String, completion: @escaping (([Question]?)-> Void)) {
        
        // url
        guard var url = Constants.baseURL else { completion(nil) ; return }
        url.appendPathExtension("api")
        url.appendPathExtension("php")
        let urlParamaters = ["amount" : "\(Constants.amountLimit)",
                             "type" : "multiple"]
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        let queryItem = urlParamaters.compactMap { URLQueryItem(name: $0.key, value: $0.value) }
        components?.queryItems = queryItem
        guard let completeURL = components?.url else { completion(nil) ; return }
        print("\(completeURL) ✅")
        
        // request
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.httpBody = nil
        
        // datasessions + resume + decode
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                print("Error fetching questions ❌: \(error.localizedDescription)")
                completion(nil)
                return
            }
            guard let data = data else { completion(nil) ; return }
            let jsonDecoder = JSONDecoder()
            do {
                let topLevelData = try jsonDecoder.decode(TopLevelData.self, from: data)
                let questionItem = topLevelData.results
                completion(questionItem)
                return
            } catch let error {
                print("Error decoding data: \(error.localizedDescription)")
                completion(nil)
                return
            }
        }.resume()
    }
    
    // Create the function that will randomize the questions on the buttons
    static func randomizingQuizAnswers(answers: Array <String>) {
        
    }
}
