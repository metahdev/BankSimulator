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

// MARK:- Extensions
extension SettingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "reuseID")
        cell.textLabel!.text = "Meet the developers"
        return cell
    }
}

extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.isSelected = !cell!.isSelected
        performSegue(withIdentifier: "DevSegue", sender: nil)
    }
}
