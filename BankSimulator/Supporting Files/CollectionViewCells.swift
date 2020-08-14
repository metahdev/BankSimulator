//
//  CollectionViewCells.swift
//  BankSimulator
//
//  Created by Metah on 8/14/20.
//  Copyright © 2020 devMetah. All rights reserved.
//


import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    // MARK:- Properties
    var imageName: String! {
        didSet {
            imageView.image = UIImage(named: imageName)
        }
    }
    @IBOutlet private weak var imageView: UIImageView!
}

class DevCVCell: UICollectionViewCell {
    // MARK:- Properties
    var title: String! {
        didSet {
            titleLabel.text = title
        }
    }
    var imageName: String! {
        didSet {
            imageView.image = UIImage(named: imageName)
        }
    }
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var imageView: UIImageView!
}
