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
    var model = ["Name: Pam Beezley", "Age: 24", "Gender: female", "Working place: paper company", "History record: 1 closed debt", "Felonies: none", "Requested sum: 20,000$"]
    
    
    // MARK:- View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        detailsTV.dataSource = self
        detailsTV.delegate = self
        self.detailsTV.tableFooterView = UIView()
    }
    
    
    // MARK:- Actions
    @IBAction func decline(_ sender: Any) {
        
    }
    
    @IBAction func accept(_ sender: Any) {
        let alert = UIAlertController(title: "You got it!", message: "AI answer: rejected\nActual answer: accepted", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: { alert in
            UIView.animate(withDuration: 0.2, animations: {
                self.iconIV.center.x += self.view.frame.width
            }, completion: { _ in
                self.iconIV.center.x -= self.view.frame.width
                self.iconIV.image = UIImage(named: "redhair_male")
            })
            self.model = ["Name: Dwight Shrute", "Age: 32", "Gender: male", "Working place: paper company", "History record: 0 debts", "Felonies: none", "Requested sum: 35,000$"]
            self.detailsTV.reloadData()
        })
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}


extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "reuseID")
        cell.textLabel!.textColor = .darkGray
        cell.textLabel!.font = UIFont(name: "Avenir-Medium", size: 17)
        cell.textLabel!.text = model[indexPath.row]
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    
}
