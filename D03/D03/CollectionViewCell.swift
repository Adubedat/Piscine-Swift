//
//  CollectionViewCell.swift
//  D03
//
//  Created by Arthur DUBEDAT on 3/29/18.
//  Copyright © 2018 Arthur DUBEDAT. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var imageUrl : String? {
        didSet {
            if let urlString = imageUrl {
                let url = URL(string: urlString)
                if let data = try? Data(contentsOf: url!, options: .uncached) {
                    imageView.image = UIImage(data: data)
                }
            }
        }
    }
}
