//
//  Content.swift
//  BankSimulator
//
//  Created by Metah on 8/14/20.
//  Copyright © 2020 devMetah. All rights reserved.
//

import Foundation

class Model {
    var name: String
    var age: Int
    var gender: String
    var workingPlace: String
    var salary: Int
    var historyRecord: String
    var felonies: String
    var sum: Int
    
    init(name: String, age: Int, gender: String, workingPlace: String, salary: Int, historyRecord: String, felonies: String, sum: Int) {
        self.name = name
        self.age = age
        self.gender = gender
        self.workingPlace = workingPlace
        self.salary = salary
        self.historyRecord = historyRecord
        self.felonies = felonies
        self.sum = sum
    }
}

struct Content {
    // MARK:- Properties
    static let testAccuracy = 0.75
    
    static let models = [
        Model(name: "Pam Beesly", age: 24, gender: "female", workingPlace: "paper company 'Dunder Mifflin'", salary: 17000, historyRecord: "1 closed debt", felonies: "none", sum: 20000),
        Model(name: "Dwight Shrude", age: 31, gender: "male", workingPlace: "Police station", salary: 12000, historyRecord: "1 current debt", felonies: "none", sum: 40000),
    ]
    
    static let modelsAnswers = [true, true, false]
    static var modelsAIAnswers = [true, true, true]
    
    static let settingsCells = [
        "How to play?",
        "Meet the developers",
        "FAQ"
    ]
    
    static let instructions = ["home"]
    
    
    // MARK:- Methods
    static func getImage(for model: Model) -> String {
        var imageName = ""
        
        let hair = ["blonde", "redhair", "bbh", "bbh1", "wbh"]
        
        let index = Int.random(in: 0..<hair.count)
        
        imageName += hair[index]
        imageName += "_\(model.gender)"
        
        return imageName
    }
    
    static func recalculateAIAnswers() {
        let range = 0..<modelsAnswers.count
        let endingIndex = round(Double(modelsAnswers.count) * testAccuracy)
        
        modelsAIAnswers = []
        for _ in 0...Int(endingIndex) {
            modelsAIAnswers.append(modelsAnswers[Int.random(in: range)])
        }
    }
}
