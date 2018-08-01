//
//  Client.swift
//  RealTableViewPractice
//
//  Created by Corey McLaughlin on 6/14/18.
//  Copyright © 2018 Corey McLaughlin. All rights reserved.
//

import Foundation

/*
 CLASSES
 
 Trainer
 firstName:
 lastName
 passcode
 
 
 Client
 Package
 
 */

class Client {
    
    var firstName: String
    var lastName: String
    var packages: [Package] = []
    var passcode: Int = 1234
    var sessionsTrained: Int {
        var helper: Int = 0
        for package in self.packages {
            if package.isActive == false {
                helper  += package.sessions
            } else if package.isActive == true {
                helper += package.sessions - package.sessionsRemaining
            }
        }
        return helper
    }
    
    
    init(firstName: String, lastName: String){
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func trainSession() -> Bool {
        var activePackage: Package?
        for package in self.packages {
            if package.isActive == true {
                activePackage = package
                activePackage?.sessionsRemaining -= 1
                if activePackage?.sessionsRemaining == 0 {
                    activePackage?.isActive = false
                return true
                }
            }
        }
        return false
    }
        
        
    
    
    
}


class Package {
    
    let sessions: Int
    var sessionsRemaining: Int
    let rate: Int
    let percentage: Double
    var isActive: Bool
    
    init(sessions: Int, sessionsRemaining: Int, rate: Int, percentage: Double) {
        self.sessions = sessions
        self.sessionsRemaining = sessionsRemaining
        self.rate = rate
        self.percentage = percentage
        self.isActive = true
        
    }
}
