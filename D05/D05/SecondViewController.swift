//
//  SecondViewController.swift
//  D05
//
//  Created by Arthur DUBEDAT on 4/2/18.
//  Copyright © 2018 Arthur DUBEDAT. All rights reserved.
//

import UIKit
import MapKit

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Places.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "placesCell") as! placesTableViewCell
        
        cell.placeLabel!.text = Places.list[indexPath.row].0
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let controller = self.tabBarController?.viewControllers![0] as? FirstViewController else { return }
        controller.mapView.setRegion(MKCoordinateRegionMakeWithDistance(Places.list[indexPath.row].2, 1000, 1000), animated: true)
        self.tabBarController?.selectedIndex = 0
        
    }
}

