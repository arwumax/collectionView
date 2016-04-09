//
//  PageCollectionViewCell.swift
//  Carousell_demo_collectionView
//
//  Created by WuKwok Ho on 7/4/2016.
//  Copyright © 2016 Wu Kwok Ho. All rights reserved.
//

import UIKit

class PageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var pageImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = UIScreen.mainScreen().bounds

        gradient.colors = [UIColor(red: 255.0/255.0, green: 227.0/255.0, blue: 0.0/255.0, alpha: 0.1).CGColor, UIColor(red: 35.0/255.0, green: 2.0/255.0, blue: 2.0/255.0, alpha: 0.8).CGColor]
        pageImageView.layer.insertSublayer(gradient, atIndex: 0)
        
        
    }

}
