//
//  HowToViewController.swift
//  BankSimulator
//
//  Created by Metah on 8/14/20.
//  Copyright © 2020 devMetah. All rights reserved.
//

import UIKit

class HowToViewController: UIViewController {
    // MARK:- Properties
    var fromSettings = false
    private var index = 0
    
    @IBOutlet private weak var nextBtn: UIButton!
    @IBOutlet private weak var pageControl: UIPageControl!
    @IBOutlet private weak var collectionView: UICollectionView!
    
    
    // MARK:- View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        nextBtn.layer.cornerRadius = 5
    }
    
    
    // MARK:- Actions
    @IBAction private func next(_ sender: Any) {
        if index == Content.instructions.count {
            exit()
        }
        pageControl.currentPage = index
    }
    
    @IBAction private func skip(_ sender: Any) {
        exit()
    }
    
    private func exit() {
        if fromSettings {
            self.dismiss(animated: true, completion: nil)
        } else {
            UserDefaults.standard.set(true, forKey: "hasEntered")
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let tabBar = storyboard.instantiateViewController(withIdentifier: "TabBarController")
            navigationController?.pushViewController(tabBar, animated: true)
            self.show(tabBar, sender: nil)
        }
    }
}


// MARK:- Extensions
extension HowToViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reuseID", for: indexPath) as! ImageCollectionViewCell
        cell.imageName = Content.instructions[indexPath.row]
        return cell
    }
}

extension HowToViewController: UICollectionViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        index = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        pageControl.currentPage = index
    }
}

extension HowToViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
}
