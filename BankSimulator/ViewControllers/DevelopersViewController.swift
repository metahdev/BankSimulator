//
//  DevelopersViewController.swift
//  BankSimulator
//
//  Created by Metah on 8/14/20.
//  Copyright © 2020 devMetah. All rights reserved.
//

import UIKit

class DevelopersViewController: UIViewController {
    // MARK:- Properties
    @IBOutlet weak var collectionView: UICollectionView!
    

    // MARK:- View Lifecycle 
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}


// MARK:- Extensions
extension DevelopersViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reuseID", for: indexPath)
        return cell
    }
}

extension DevelopersViewController: UICollectionViewDelegate {
    
}
