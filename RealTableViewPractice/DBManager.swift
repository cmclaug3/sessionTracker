//
//  Managers.swift
//  RealTableViewPractice
//
//  Created by Corey McLaughlin on 8/1/18.
//  Copyright © 2018 Corey McLaughlin. All rights reserved.
//

import Foundation
import RealmSwift



class DBTrainerManager {
    
    private var database: Realm
    static let sharedInstance = DBTraineryManager()
    
    private init() {
        database = try! Realm()
    }
    
    
    func getAllClients() -> Results<Client> {
        let results: Results<Client> = database.objects(Client.self)
        return results
    }
    
    
    /*
     Possible Methods
     
     getAllClients()
     sessionsTrained()
     
     
     
     serveSession()
     burnSession()
     setSessionAsAway()
     
 
    */
    
}
