//
//  TableViewController.swift
//  D02
//
//  Created by Arthur DUBEDAT on 3/28/18.
//  Copyright © 2018 Arthur DUBEDAT. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    @IBOutlet var deathListView: UITableView!
    
    @objc func addButtonPressed(sender: UIBarButtonItem) {
        performSegue(withIdentifier: "addButtonSegue", sender: self)
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Death Note"
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(TableViewController.addButtonPressed))
        self.navigationItem.rightBarButtonItem = addButton
        
        deathListView.estimatedRowHeight = 90.0
        deathListView.rowHeight = UITableViewAutomaticDimension
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.deaths.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "deathCell") as! DeathTableViewCell
        cell.deathCell = Data.deaths[indexPath.row]
        return cell
    }
}
