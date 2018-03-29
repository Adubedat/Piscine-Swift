//
//  ViewController.swift
//  D02
//
//  Created by Arthur DUBEDAT on 3/29/18.
//  Copyright © 2018 Arthur DUBEDAT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var descriptionTextField: UITextView!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @objc func doneButtonPressed(sender: UIBarButtonItem) {
        performSegue(withIdentifier: "doneSegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Add a person"
        datePicker.minimumDate = Date()
        descriptionTextField.layer.borderWidth = 1
        let addButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(ViewController.doneButtonPressed))
        self.navigationItem.rightBarButtonItem = addButton
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "doneSegue" {
            if let tvc = segue.destination as? TableViewController {
                if let name = nameTextField.text {
                    Data.deaths.append((name, descriptionTextField.text, datePicker.date))
                    tvc.deathListView.beginUpdates()
                    tvc.deathListView.insertRows(at: [IndexPath(row: Data.deaths.count-1, section: 0)], with: .automatic)
                    tvc.deathListView.endUpdates()
                }
            }
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        let newLength = text.count + string.count - range.length
        if textField == nameTextField {
            return newLength <= 30
        }
        else if textField == descriptionTextField {
            return newLength <= 500
        }
        return true
    }
}
