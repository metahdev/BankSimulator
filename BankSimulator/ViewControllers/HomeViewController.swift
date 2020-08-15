//
//  HomeViewController.swift
//  BankSimulator
//
//  Created by Metah on 8/13/20.
//  Copyright © 2020 devMetah. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    // MARK:- Properties
    @IBOutlet private weak var iconIV: UIImageView!
    @IBOutlet private weak var detailsTV: UITableView!
    @IBOutlet private weak var userPointsLbl: UILabel!
    @IBOutlet private weak var AIpointsLbl: UILabel!
    @IBOutlet private weak var timerLbl: UILabel!
    
    private var currentModel: Model!
    private var currentIndex = 0
    private var won = false
    private var lastOne = false
    
    private var userPoints = 0
    private var AIpoints = 0
    
    private var timer = Timer()
    private var counter = 0
    
    
    // MARK:- View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setProperties()
        Content.recalculateAIAnswers()
        setContent()
    }
    
    private func setProperties() {
        detailsTV.dataSource = self
        detailsTV.delegate = self
        self.detailsTV.tableFooterView = UIView()
    }
    
    private func setContent() {
        currentModel = Content.models[currentIndex]
        let name = Content.getImage(for: currentModel)
        
        iconIV.image = UIImage(named: name)
        detailsTV.reloadData()
    }

    private func updateModel() {
        currentIndex += 1
        lastOne = (currentIndex + 1 == Content.models.count)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        runTimer()
    }
    
    private func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(secondPassed), userInfo: nil, repeats: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    
    
    // MARK:- Actions
    @objc
    private func secondPassed() {
        counter += 1
        timerLbl.text = "Remaining time: \(60 - counter)"
        if 60 - counter == 0 {
            timer.invalidate()
            counter = 0
            showAlert("Game Over ", "Timer exceeded. You lost.", btnTitle: "Try again!", handler: {
                self.nullifyData()
                self.runTimer()
            })
        }
    }
    
    @IBAction func decline(_ sender: Any) {
        won = Content.modelsAnswers[currentIndex] == "rejected"
        
        checkValues()
        updateScores()
        showRoundAlert(accepted: false)
    }
    
    @IBAction func accept(_ sender: Any) {
        won = Content.modelsAnswers[currentIndex] == "accepted"

        checkValues()
        updateScores()
        showRoundAlert(accepted: true)
    }
    
    private func checkValues() {
        if won {
            userPoints += 1
        }
        if Content.modelsAIAnswers[currentIndex] == Content.modelsAnswers[currentIndex] {
            AIpoints += 1
        }
    }
    
    private func updateScores() {
        userPointsLbl.text = "Your score: \(userPoints)"
        AIpointsLbl.text = "AI score: \(AIpoints)"
    }
    
    private func showRoundAlert(accepted: Bool) {
        let title = won ? "You got it!" : "Oops! Wrong answer"
        let AIanswer = Content.modelsAIAnswers[currentIndex]
        
        let message = "AI answer: \(AIanswer)\nActual answer: \(Content.modelsAnswers[currentIndex])"
        
        #warning("alert might end when another alert is on")
        showAlert(title, message, btnTitle: "OK", handler: {
            UIView.animate(withDuration: 0.3, animations: {
                if !self.lastOne {
                    accepted ? self.moveRight() : self.moveLeft()
                }
            }, completion: { _ in
                self.roundCompletion(accepted)
            })
        })
    }
    
    private func roundCompletion(_ accepted: Bool) {
        guard !lastOne else {
            self.restartTheGame()
            return
        }
        accepted ? self.moveLeft() : self.moveRight()
        self.updateModel()
        self.setContent()
    }
    
    private func showAlert(_ title: String, _ message: String, btnTitle: String, handler: @escaping () -> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: {_ in
            handler()
        })
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
    private func moveRight() {
        self.iconIV.center.x += self.view.frame.width
    }
    
    private func moveLeft() {
        self.iconIV.center.x -= self.view.frame.width
    }
    
    private func restartTheGame() {
        var message = "You won! 🧠"
        if userPoints == AIpoints {
            message = "It's a draw 🗿"
        } else if userPoints < AIpoints {
            message = "You lost 💀"
        }
        message += " Should we try one more time?"
        
        timer.invalidate()
        counter = 0
        nullifyData()
        
        showAlert("Game Over 👾", message, btnTitle: "Let's go!", handler: {
            self.updateModel()
            self.setContent()
            self.updateScores()
        })
    }
    
    private func nullifyData() {
        currentIndex = -1
        won = false
        lastOne = false
               
        userPoints = 0
        AIpoints = 0
    }
}


extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "reuseID")
        cell.textLabel!.textColor = .darkGray
        cell.textLabel!.font = UIFont(name: "Avenir-Medium", size: 17)
        
        var text = "Name: " + currentModel.name
        switch indexPath.row {
        case 0:
            break
        case 1:
            text = "Age: \(currentModel.age)"
        case 2:
            text = "Gender: \(currentModel.gender)"
        case 4:
            text = "Salary/month: \(currentModel.salary)$"
        case 3:
            text = "Working place: \(currentModel.workingPlace)"
        case 5:
            text = "History record: \(currentModel.historyRecord)"
        case 6:
            text = "Felonies: \(currentModel.felonies)"
        default:
            text = "Requested loan: \(currentModel.sum)$"
        }
        cell.textLabel!.text = text
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)!
        cell.isSelected = !cell.isSelected
    }
}
