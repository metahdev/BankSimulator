//
//  Content.swift
//  BankSimulator
//
//  Created by Metah on 8/14/20.
//  Copyright © 2020 devMetah. All rights reserved.
//

import Foundation

#warning("TODO")
/* 
 After:
 Finish the HowToVC
 Create images of 'How to play'
 Finish the AI source code
 */

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
    static let testAccuracy = 68...86
    static let modelsAnswers = ["accepted", "accepted", "rejected", "accepted"]
    static var modelsAIAnswers = [String]()
    
    static let settingsCells = [
        "How to play?",
        "Meet the developers",
        "AI source code"
    ]
    
    static let instructions = ["home"]
    static let devs = ["Victor", "Askar", "Diana", "Tamirlan"]
    static let devsDescriptions = ["Victor Kovalchuk,\nhead AI developer. A big fan of math and toy horses. The last person who took his horse without permission went missing.", "Askar Almukhamet,\nhead iOS developer. Hobby - drinking coffee. Interests: coffee. Favorite edible substance - coffee. Future plans? Kidnap a barista.", "Diana Umbetkaliyeva, junior iOS developer, babysitter. Favorite food - burgers. Hobby not found", "Tamirlan Bektemissov,\njunior AI developer. Doesn't know what he is doing here."]
    
    static let models = [
        Model(name: "Pam Beesly", age: 32, gender: "female", workingPlace: "'Dunder Mifflin' paper company", salary: 3416, historyRecord: "1 closed debt", felonies: "none", sum: 15000),
        
        Model(name: "Dwight Shrude", age: 35, gender: "male", workingPlace: "Police station", salary: 4700, historyRecord: "no debt history", felonies: "none", sum: 20000),
       
        Model(name: "Michael Scott", age: 44, gender: "male", workingPlace: "Regional manager of 'Dunder Mifflin', Scranton", salary: 12000, historyRecord: "3 current debts", felonies: "none", sum: 15000),

        Model(name: "Jim Halpert", age: 34, gender: "male", workingPlace: "CEO of 'Athlead'", salary: 6600, historyRecord: "no debt history", felonies: "none", sum: 40000),
    ]
    
    
    // MARK:- Methods
    static func recalculateAIAnswers() {
        #warning("test accuracy algorithm isn't quite correct")
        modelsAIAnswers = []
        let randomEndingIndex = Int.random(in: testAccuracy)
        for i in 0..<modelsAnswers.count {
            let randomNum = Int.random(in: 0...100)
            if randomNum <= randomEndingIndex {
                modelsAIAnswers.append(modelsAnswers[i])
            } else {
                if modelsAnswers[i] == "rejected" {
                    modelsAIAnswers.append("accepted")
                } else {
                    modelsAIAnswers.append("rejected")
                }
            }
        }
    }
}
