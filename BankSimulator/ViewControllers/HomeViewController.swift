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
    @IBOutlet weak var iconIV: UIImageView!
    @IBOutlet weak var detailsTV: UITableView!
    @IBOutlet weak var userPointsLbl: UILabel!
    @IBOutlet weak var AIpointsLbl: UILabel!
    
    var currentModel: Model!
    var currentIndex = 0
    var won = false
    var lastOne = false
    
    var userPoints = 0
    var AIpoints = 0
    
    
    // MARK:- View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setProperties()
        Content.recalculateAIAnswers()
    }
    
    private func setProperties() {
        detailsTV.dataSource = self
        detailsTV.delegate = self
        self.detailsTV.tableFooterView = UIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateModel()
    }
    
    private func updateModel() {
        currentModel = Content.models[currentIndex]
        let name = Content.getImage(for: currentModel)
        
        iconIV.image = UIImage(named: name)
        detailsTV.reloadData()
        
        currentIndex += 1
        lastOne = (currentIndex == Content.models.count)
    }
    
    
    // MARK:- Actions
    @IBAction func decline(_ sender: Any) {
        guard !lastOne else {
            restartTheGame()
            return
        }
        won = !Content.modelsAnswers[currentIndex]
        showRoundAlert(accepted: false)
    }
    
    @IBAction func accept(_ sender: Any) {
        guard !lastOne else {
            restartTheGame()
            return
        }
        won = Content.modelsAnswers[currentIndex]
        showRoundAlert(accepted: true)
    }
    
    private func updateScores() {
        if won {
            userPoints += 1
        }
        if Content.modelsAIAnswers == Content.modelsAnswers {
            AIpoints += 1
        }
        userPointsLbl.text = "Your score: \(userPoints)"
        AIpointsLbl.text = "AI score: \(AIpoints)"
    }
    
    private func showRoundAlert(accepted: Bool) {
        let title = won ? "You got it!" : "Oops! Wrong answer"
        let AIanswer = Content.modelsAIAnswers[currentIndex]
        
        let message = "AI answer: \(AIanswer)\nActual answer: \(Content.modelsAnswers[currentIndex])"
        
        showAlert(title, message, btnTitle: "OK", handler: {
            UIView.animate(withDuration: 0.3, animations: {
                accepted ? self.moveRight() : self.moveLeft()
            }, completion: { _ in
                accepted ? self.moveLeft() : self.moveRight()
                self.updateModel()
                self.updateScores()
            })
        })
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
        currentIndex = 0
        won = false
        lastOne = false
        
        let title = userPoints > AIpoints ? "You won this game! 🧠" : "You lost this game 🗿"
        let message = userPoints > AIpoints ? "Wanna play more?" : "Should we try one more time?"
        
        showAlert(title, message, btnTitle: "Let's go!", handler: {
            self.updateModel()
        })
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
            text = "Salary/month: \(currentModel.salary)"
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
