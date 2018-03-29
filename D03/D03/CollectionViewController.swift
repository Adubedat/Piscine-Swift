//
//  CollectionViewController.swift
//  D03
//
//  Created by Arthur DUBEDAT on 3/29/18.
//  Copyright © 2018 Arthur DUBEDAT. All rights reserved.
//

import UIKit

private let reuseIdentifier = "imgCell"

class CollectionViewController: UICollectionViewController {

    @IBOutlet var imgCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes

        // Do any additional setup after loading the view.
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 4
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
    
        cell.imageUrl = Images.urls[indexPath.row]
        // Configure the cell
        return cell
    }

}
