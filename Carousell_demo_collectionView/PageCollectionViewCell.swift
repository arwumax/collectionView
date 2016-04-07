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
    }

}
