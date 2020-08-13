//
//  SettingsViewController.swift
//  BankSimulator
//
//  Created by Metah on 8/13/20.
//  Copyright © 2020 devMetah. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    // MARK:- Properties
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK:- View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
    }
}

extension SettingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "reuseID")
        switch indexPath.row {
        case 0:
            cell.textLabel!.text = "How to Play?"
        case 1:
            cell.textLabel!.text = "Meet the developers"
        default:
            cell.textLabel!.text = "FAQ"
        }
        return cell
    }
}

extension SettingsViewController: UITableViewDelegate {
    
}
