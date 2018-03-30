//
//  CollectionViewController.swift
//  D03
//
//  Created by Arthur DUBEDAT on 3/29/18.
//  Copyright © 2018 Arthur DUBEDAT. All rights reserved.
//

import UIKit

private let reuseIdentifier = "imgCell"

let imageCache = NSCache<NSString, UIImage>()

class CollectionViewController: UICollectionViewController {

    @IBOutlet var imgCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Gallery"
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
        return Images.urls.count
    }

    func downloadImg(from imgUrl: String) -> UIImage? {

        
        if let imageToCache = imageCache.object(forKey: imgUrl as NSString) {
            return imageToCache
        }
        do {
            let url = URL(string: imgUrl)
            let data = try Data(contentsOf: url!)
            let image = UIImage(data: data)
            imageCache.setObject(image!, forKey: imgUrl as NSString)
            return image
        } catch {
            let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        return nil
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
    
        cell.imageView.image = nil
        cell.activityMonitor.startAnimating()
        let qos = DispatchQoS.background.qosClass
        let queue = DispatchQueue.global(qos: qos)
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        queue.async {
            let image = self.downloadImg(from: Images.urls[indexPath.row])
            DispatchQueue.main.async {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                cell.activityMonitor.stopAnimating()
                cell.imageView.image = image
            }
        }
        // Configure the cell
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let selectedCell = collectionView.cellForItem(at: indexPath)
        
        performSegue(withIdentifier: "scrollViewSegue", sender: selectedCell)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "scrollViewSegue" {
            let dvc = segue.destination as! ScrollViewController
            let imgClicked = sender as! CollectionViewCell
            dvc.itemToAdd = imgClicked.imageView.image
        }
    }
}
