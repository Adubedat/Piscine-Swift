//
//  ScrollViewController.swift
//  D03
//
//  Created by Arthur DUBEDAT on 3/30/18.
//  Copyright © 2018 Arthur DUBEDAT. All rights reserved.
//

import UIKit

class ScrollViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollViewImage: UIScrollView!
    var itemToAdd : UIImage?
    var imageView : UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Zoom"
        imageView = UIImageView(image: itemToAdd)
        scrollViewImage.addSubview(imageView!)
        scrollViewImage.contentSize = imageView!.frame.size
        scrollViewImage.maximumZoomScale = 100
        scrollViewImage.minimumZoomScale = self.scrollViewImage.frame.size.width / self.imageView!.frame.size.width;
        NotificationCenter.default.removeObserver(self)
        NotificationCenter.default.addObserver(self, selector: #selector(self.rotated), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
        // Do any additional setup after loading the view.
    }

    @objc func rotated () {
        scrollViewImage.minimumZoomScale = self.scrollViewImage.frame.size.width / self.itemToAdd!.size.width;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  /*  override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if UIDevice.current.orientation.isLandscape {
            print ("isLandscape")
            scrollViewImage.minimumZoomScale = self.scrollViewImage.frame.size.width / self.imageView!.frame.size.width;
        }
        else {
            scrollViewImage.minimumZoomScale = self.scrollViewImage.frame.size.width / self.imageView!.frame.size.width;
        }
    }*/
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
