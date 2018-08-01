//
//  AddClient.swift
//  RealTableViewPractice
//
//  Created by Corey McLaughlin on 7/11/18.
//  Copyright © 2018 Corey McLaughlin. All rights reserved.
//

import UIKit

class AddClient: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var percentageSlider: UISlider!
    @IBOutlet weak var percentageLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        

    }

    @IBAction func sliderValueChange(_ sender: UISlider) {
        sliderLabel.text = String(Int(sender.value))
    }
    
    @IBAction func percentageSliderValueChange(_ sender: UISlider) {
        percentageLabel.text = "\(String(Int(sender.value)))%"
    }
    

}
