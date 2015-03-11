//
//  ViewController.swift
//  open weather
//
//  Created by Andre Shonubi on 3/9/15.
//  Copyright (c) 2015 Andre Shonubi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var weatherDescription: UILabel!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    
    @IBAction func updateWeather(sender: AnyObject) {
        weatherDescription.text = "Loading..."
        
        Weather.retrieveWeather(self.cityTextField.text + "," + self.stateTextField.text) { (weather) -> Void in
            
            self.weatherDescription.text = weather.friendlyWeather
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Weather.retrieveWeather(("washington,dc"), { (weather) -> Void in
            self.weatherDescription.text = weather.friendlyWeather
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        


}

