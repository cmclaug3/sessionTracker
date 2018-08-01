//
//  Client.swift
//  RealTableViewPractice
//
//  Created by Corey McLaughlin on 6/14/18.
//  Copyright © 2018 Corey McLaughlin. All rights reserved.
//

import Foundation
import RealmSwift

/*
 CLASSES --> Realm doesnt currently support class inheritance
 
 Trainer
 firstName
 lastName
 passcode
 clients
 METHODS
 sessionsServed()
 getAllPackages()
 
 
 
 Client (every client must have atleast one package)
 firstName
 lastName
 passcode
 trainer
 packages
 METHODS
 sessionsTrained()
 
 
 Package
 sessions
 sessionsRemaining
 rate
 percentage
 isActive: Bool
 */


class Trainer: Object {
    
    @objc dynamic var ID: Int = 0
    @objc dynamic var firstName: String = ""
    @objc dynamic var lastName: String = ""
    @objc dynamic var passcode: String = ""
    @objc dynamic var clients: [Client] = []
    
    override static func primaryKey() -> String? {
        return "ID"
    }
}


class Client: Object {
    
    @objc dynamic var ID: Int = 0
    @objc dynamic var firstName: String = ""
    @objc dynamic var lastName: String = ""
    @objc dynamic var packages: [Package] = []
    @objc dynamic var passcode: String = ""
    
    override static func primaryKey() -> String? {
        return "ID"
    }
    
    
    // ***** FIGURE OUT WHAT DO TO WITH THESE
    //       THEY CANT BE APART OF THE MODEL
    
    func sessionsTrained() -> Int {
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
    
    // Definitely needs to be rewritten and probably put into Manager
    //  class for managing the crud
    func trainSession() -> Bool {
        var activePackage: Package?
        // YOU CANT BECOME A CLIENT IF YOU HAVENT PURCHASED A PACKAGE *****
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


class Package: Object {
    
    @objc dynamic var sessions: Int = 0
    @objc dynamic var sessionsRemaining: Int = 0
    @objc dynamic var rate: Int = 0
    @objc dynamic var percentage: Float = 0.0
    @objc dynamic var isActive: Bool = true
    
}
