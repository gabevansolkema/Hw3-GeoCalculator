//
//  ViewController.swift
//  CIS357 Homework 3
//
//  Created by Gabe VanSolkema on 9/22/17.
//  Copyright © 2017 Gabe VanSolkema. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var latField1: UITextField!
    @IBOutlet weak var lonField1: UITextField!
    @IBOutlet weak var latField2: UITextField!
    @IBOutlet weak var lonField2: UITextField!
    
    @IBOutlet weak var distanceField: UILabel!
    @IBOutlet weak var bearingField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let detectTouch = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        self.view.addGestureRecognizer(detectTouch)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calcBtnPressed(_ sender: Any) {
        let lat1 = Double(latField1.text!)!
        let lat2 = Double(latField2.text!)!
        let lon1 = Double(lonField1.text!)!
        let lon2 = Double(lonField2.text!)!
        
        let latDif = abs(lat2 - lat1)
        let lonDif = abs(lon2 - lon1)
        
        let earthR = 6373.0
        
        let bearing = pow(sin(latDif/2), 2) + cos(lat1) * cos(lat2) * pow(sin(lonDif/2), 2)
        
        let c = 2 * atan2(sqrt(bearing), sqrt(1 - bearing))
        
        let distance = earthR * c
        
        self.distanceField.text = "Distance: \(distance)"
        self.bearingField.text = "Bearing: \(bearing)"
        
        
    }
    
    @IBAction func clearBtnPressed(_ sender: Any) {
        self.latField1.text = ""
        self.latField2.text = ""
        self.lonField1.text = ""
        self.lonField2.text = ""
        
        self.distanceField.text = "Distance: -"
        self.bearingField.text = "Bearing: -"
    }
    
    func dismissKeyboard() {
        self.view.endEditing(true)
    }

}

