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
    static let modelsAnswers = ["accepted", "accepted", "rejected", "rejected", "accepted", "rejected", "accepted", "rejected", "accepted", "accepted", "rejected", "rejected", "accepted", "accepted", "rejected", "accepted", "rejected", "accepted", "rejected", "accepted"]
    static var modelsAIAnswers = [String]()
    
    static let settingsCells = [
        "How to play?",
        "Meet the developers",
        "AI source code"
    ]
    
    static let instructions = ["home"]
    static let devs = ["Victor", "Askar", "Diana", "Tamirlan"]
    static let devsDescriptions = ["Victor Kovalchuk,\nhead AI developer. A big fan of math and toy horses. The last person who took his horse without a permission went missing.", "Tamirlan Bektemissov,\njunior AI developer. Doesn't know what he is doing here.", "Diana Umbetkaliyeva, junior iOS developer, babysitter. Favorite food - burgers. Hobby-not found", "Askar Almukhamet,\nhead iOS developer. Hobby - drinking coffee. Interests: coffee. Favorite edible substance - coffee. Future plans? Kidnap a barista."]
    
    static let models = [
        Model(name: "Pam Beesly", age: 30, gender: "female", workingPlace: "paper company 'Dunder Mifflin'", salary: 17000, historyRecord: "1 closed debt", felonies: "none", sum: 20000),
        
        Model(name: "Dwight Shrude", age: 35, gender: "male", workingPlace: "Police station", salary: 12000, historyRecord: "no debt history", felonies: "none", sum: 40000),
        
        Model(name: "Kelly Kapoor", age: 28, gender: "female", workingPlace: "Fashion house", salary: 16000, historyRecord: "2 current debts", felonies: "Youth detention center", sum: 20000),
        
        Model(name: "Michael Scott", age: 44, gender: "male", workingPlace: "'Dunder Mifflin' sales company", salary: 35000, historyRecord: "3 current debts", felonies: "none", sum: 42000),

        Model(name: "Angela Martin", age: 31, gender: "female", workingPlace: "Church", salary: 12000, historyRecord: "no debt history", felonies: "none", sum: 30000),

        Model(name: "Ryan Howard", age: 24, gender: "male", workingPlace: "Consulting Company", salary: 11000, historyRecord: "1 closed debt", felonies: "financial fraud", sum: 37000),

        Model(name: "Phyllis Vance", age: 44, gender: "female", workingPlace: "Private business 'Vance Refrigeration'", salary: 37000, historyRecord: "2 current debts", felonies: "none", sum: 50000),

        Model(name: "Toby Flenderson", age: 52, gender: "male", workingPlace: "Travel agency", salary: 16000, historyRecord: "4 current debts", felonies: "drug use", sum: 16000),

        Model(name: "Holly Flax", age: 42, gender: "female", workingPlace: "HR company", salary: 20000, historyRecord: "2 closed debts", felonies: "none", sum: 22000),

        Model(name: "Kevin Malone", age: 35, gender: "male", workingPlace: "Sales", salary: 40000, historyRecord: "1 closed debt", felonies: "none", sum: 69000),

        Model(name: "Jan Levinson", age: 40, gender: "female", workingPlace: "Art Studio", salary: 15000, historyRecord: "2 current debts", felonies: "none", sum: 40000),

        Model(name: "Andy Bernard", age: 37, gender: "male", workingPlace: "Psychological Center", salary: 25000, historyRecord: "5 current debts", felonies: "Public order disturbance", sum: 5000),

        Model(name: "Karen Filipelli", age: 32, gender: "female", workingPlace: "Sales company", salary: 40000, historyRecord: "0 current debts", felonies: "none", sum: 20000),

        Model(name: "Stanley Hudson", age: 55, gender: "male", workingPlace: "Hospital", salary: 27000, historyRecord: "3 closed debts", felonies: "none", sum: 31000),

        Model(name: "Meredith Palmer", age: 42, gender: "female", workingPlace: "SPA center", salary: 22000, historyRecord: "1 current debt", felonies: "drunk driving", sum: 18000),

        Model(name: "Gabe Lewis", age: 25, gender: "male", workingPlace: "IT company", salary: 26000, historyRecord: "1 closed debt", felonies: "none", sum: 1500),
        
        Model(name: "Erin Hannon", age: 37, gender: "female", workingPlace: "TV channel", salary: 14000, historyRecord: "2 current debts", felonies: "none", sum: 30000),

        Model(name: "Jim Halpert", age: 31, gender: "male", workingPlace: "Bank", salary: 29000, historyRecord: "no debt history", felonies: "none", sum: 15000),

        Model(name: "Nellie Bertram", age: 30, gender: "female", workingPlace: "Veterinary clinic", salary: 25000, historyRecord: "2 current debts", felonies: "none", sum: 30000),

        Model(name: "Oscar Martinez", age: 35, gender: "male", workingPlace: "Cook", salary: 23000, historyRecord: "1 closed debt", felonies: "none", sum: 10000)
    ]
    
    
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
