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
        return Content.devs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reuseID", for: indexPath) as! DevCVCell
        cell.imageName = Content.devs[indexPath.row]
        cell.title = Content.devsDescriptions[indexPath.row]
        return cell
    }
}

extension DevelopersViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height * 0.25)
    }
}
