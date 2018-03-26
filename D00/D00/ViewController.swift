//
//  ViewController.swift
//  D00
//
//  Created by Arthur DUBEDAT on 3/26/18.
//  Copyright © 2018 Arthur DUBEDAT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
 
    var param1 : Int = 0
    var param2 : Int?
    var getFirstParam : Bool = true
    var ope : Character = "\0"
    
    @IBOutlet weak var resultDisplay: UILabel!
    
    func modifParam(value: Int) {
        if (getFirstParam) {
            param1 = param1 &* 10 &+ value
            resultDisplay.text = String(param1)
        }
        else {
            if (param2 == nil) {
                param2 = value
            }
            else {
                param2 = param2! &* 10 &+ value
            }
            resultDisplay.text = String(param2!)
        }
    }
    
    func addition() {
        if (param2 != nil) {
            param1 = param1 &+ param2!
            param2 = nil
            resultDisplay.text = String(param1)
        }
    }
    
    func substraction() {
        if (param2 != nil) {
            param1 = param1 &- param2!
            param2 = nil
            resultDisplay.text = String(param1)
        }
    }
    
    func multiplication() {
        if (param2 != nil) {
            param1 = param1 &* param2!
            param2 = nil
            resultDisplay.text = String(param1)
        }
    }
    
    func division() {
        if (param2 != nil) {
            if (param2 == 0) {
                resultDisplay.text = "Err"
            }
            else {
                param1 = param1 / param2!
                param2 = nil
                resultDisplay.text = String(param1)
            }
        }
    }
    
    func makeOperation() {
        switch ope {
        case "+" :
            addition()
        case "-" :
            substraction()
        case "*" :
            multiplication()
        case "/" :
            division()
        default :
            break
        }
    }
    
    @IBAction func operatorButton(_ sender: UIButton) {
        if (getFirstParam) {
            getFirstParam = false
        }
        else {
            makeOperation()
        }
        ope = Character(sender.currentTitle!)
    }
    
    @IBAction func numberButton(_ sender: UIButton) {
        modifParam(value: Int(sender.currentTitle!)!)
    }
    
    @IBAction func resultButton(_ sender: UIButton) {
        makeOperation()
        print(param1)
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        getFirstParam = true
        param1 = 0
        param2 = nil
        ope = Character("\0")
        resultDisplay.text = ""
    }
    
    @IBAction func negativeButton(_ sender: UIButton) {
        if (getFirstParam || param2 == nil) {
            param1 = -param1
            resultDisplay.text = String(param1)
        }
        else {
            param2 = -param2!
            resultDisplay.text = String(param2!)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

