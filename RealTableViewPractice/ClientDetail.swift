//
//  ClientDetail.swift
//  RealTableViewPractice
//
//  Created by Corey McLaughlin on 6/14/18.
//  Copyright © 2018 Corey McLaughlin. All rights reserved.
//

import UIKit

class ClientDetail: UIViewController {

    @IBOutlet weak var clientNameLabel: UILabel!
        
    @IBOutlet weak var clientSinceLabel: UILabel!
    @IBOutlet weak var sessionsTrainedLabel: UILabel!
    @IBOutlet weak var sessionsBurnedLabel: UILabel!
    @IBOutlet weak var sessionsAwayLabel: UILabel!
    @IBOutlet weak var totalSessionsServedLabel: UILabel!
    
    
    
    //WRITE ALL THINGS YOU WILL NEED TO REFERENCE
    //TO EACH CLIENT AS VARS WHEN TAPPING THEIR CELL
    var detailClient: Client?
    

    //BUTTON ACTION UI CONNECTIONS
    @IBAction func TrainSessionButton(_ sender: Any) {
        
        let currentPackageSessionTotal = (detailClient?.packages.first?.sessions)! //int
        let currentSessionNumberIfTraining = String((currentPackageSessionTotal - (detailClient!.packages.first?.sessionsRemaining)!) + 1) //string
        
        let alert = UIAlertController(title: "Train Session", message: "Provide the correct passcodes to train session \(currentSessionNumberIfTraining) of \(String(currentPackageSessionTotal)) with \(detailClient!.firstName)", preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = "Trainer Passcode here"
            textField.keyboardType = .numberPad
            textField.isSecureTextEntry = true
        }
        
        alert.addTextField { (textField) in
            textField.placeholder = "Client Passcode here"
            textField.keyboardType = .numberPad
            textField.isSecureTextEntry = true
        }
        
        
        //maybe this whole thing isnt working because detailClient.trainSession() is running
        //on data different than data that is hard coded into the clientListScreen!!!!!!!!!!!!!!!!!!!!!!!
        
        let trainAction = UIAlertAction(title: "Submit", style: .default, handler: { (yay) in
            print("running the test")
            if alert.textFields![0].text == "5223" && alert.textFields![1].text == "1234" {
                if self.detailClient!.trainSession() == true {
                    // present another alert that tells them of the success
                    // send back to clientListScreen with updated client list data
                    print("SUCCESS")
                } else {
                    // present another alert that tells them of the failure (no sessions left)
                    print("FAILURE")
                }
            } else {
                print("FAILURE TO LAUNCH")
            }
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        
        alert.addAction(trainAction)
        alert.addAction(cancelAction)
        
        alert.view.backgroundColor = UIColor.green
        alert.view.layer.cornerRadius = 25
        
        present(alert, animated: true, completion: nil)
        
        
    }
    
    
    
    @IBAction func BurnSessionButton(_ sender: Any) {
        
        let currentPackageSessionTotal = (detailClient?.packages.first?.sessions)! //int
        let currentSessionNumberIfTraining = String((currentPackageSessionTotal - (detailClient!.packages.first?.sessionsRemaining)!) + 1) //string
        
        let alert = UIAlertController(title: "Burn Session", message: "Enter pin to burn session \(currentSessionNumberIfTraining) of \(String(currentPackageSessionTotal)) from \(detailClient!.firstName) and provide a reason if applicable", preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = "Trainer Passcode here"
            textField.keyboardType = .numberPad
            textField.isSecureTextEntry = true
        }
        
        alert.addTextField { (textField) in
            textField.placeholder = "Reason?"
            textField.keyboardType = .default
        }
        
        let action1 = UIAlertAction(title: "Submit", style: .default, handler: nil)
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        
        alert.addAction(action1)
        alert.addAction(cancelAction)
        
        alert.view.backgroundColor = UIColor.red
        alert.view.layer.cornerRadius = 25
        
        present(alert, animated: true, completion: nil)
    }
    
    
    
    
    @IBAction func AwaySessionButton(_ sender: Any) {
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()

    }
    
    
    /*
    OUTLETS: fullname,
    ACTIONS: serveSession, legacyClientInsert
    */
 
    func setUI() {
        clientNameLabel.text = "\(detailClient!.firstName) \(detailClient!.lastName)"
        sessionsTrainedLabel.text = String(describing: detailClient!.sessionsTrained)
    }


}
