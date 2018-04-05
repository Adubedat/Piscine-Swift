//
//  ViewController.swift
//  D07
//
//  Created by Arthur DUBEDAT on 4/4/18.
//  Copyright © 2018 Arthur DUBEDAT. All rights reserved.
//

import UIKit
import RecastAI
import ForecastIO

class ViewController: UIViewController {

    @IBOutlet weak var entryLabel: UITextField!
    @IBOutlet weak var weatherLabel: UILabel!
    
    var bot : RecastAIClient?
    var forecastClient : DarkSkyClient?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.bot = RecastAIClient(token : recastToken)
        entryLabel.becomeFirstResponder()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func weatherRequest(_ sender: Any) {
        let request = entryLabel.text
        self.bot?.textRequest(request!, successHandler: requestDone, failureHandle: requestFailed)
        self.forecastClient = DarkSkyClient(apiKey: forecastToken)
    }
    
    func requestDone(_ response: Response?) {
        guard let location = response?.get(entity: "location") else {
            self.weatherLabel.text = "Error"
            return
        }
        let lat = location["lat"] as! Double
        let lng = location["lng"] as! Double
        requestWeather(lat: lat, lng: lng)
    }
    
    func requestWeather(lat: Double, lng: Double) {
        self.forecastClient?.getForecast(latitude: lat, longitude: lng) {
            result in
            switch result {
            case .success(let currentForecast, _):
                DispatchQueue.main.async {
                    self.weatherLabel.text = currentForecast.currently?.summary
                }
            case .failure:
                DispatchQueue.main.async {
                    self.weatherLabel.text = "Error"
                }
            }
        }
    }
    
    func requestFailed(_ error: Error) {
        weatherLabel.text = "Error"
    }
}

