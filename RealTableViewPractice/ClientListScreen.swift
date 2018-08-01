//
//  ClientListScreen.swift
//  RealTableViewPractice
//
//  Created by Corey McLaughlin on 6/14/18.
//  Copyright © 2018 Corey McLaughlin. All rights reserved.
//

import UIKit

class ClientListScreen: UIViewController {
    
    @IBOutlet weak var myTableView: UITableView!
    
    var clients: [Client] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.dataSource = self
        myTableView.delegate = self
        
        clients = createClientList()

    }
    
    
    
    func createClientList () -> [Client] {
        
        var tempClients: [Client] = []
        
        let client1 = Client(firstName: "Scotty", lastName: "Apple")
        let client2 = Client(firstName: "Amrita", lastName: "Singh")
        let client3 = Client(firstName: "Nicole", lastName: "Choi")
        let client4 = Client(firstName: "Julie", lastName: "Redwood")
        
        let package1 = Package(sessions: 10, sessionsRemaining: 9, rate: 85, percentage: 0.70)
        let package2 = Package(sessions: 15, sessionsRemaining: 8, rate: 90, percentage: 0.75)
        let package3 = Package(sessions: 5, sessionsRemaining: 2, rate: 85, percentage: 0.75)
        let package4 = Package(sessions: 10, sessionsRemaining: 2, rate: 95, percentage: 0.70)
        
        client1.packages.append(package1)
        client2.packages.append(package2)
        client3.packages.append(package3)
        client4.packages.append(package4)
        
        tempClients.append(client1)
        tempClients.append(client2)
        tempClients.append(client3)
        tempClients.append(client4)
        
        return tempClients
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MasterToDetail" {
            let destVC = segue.destination as! ClientDetail
            destVC.detailClient = sender as? Client
        }
    }
    
}


extension ClientListScreen: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let client = clients[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ClientCell") as! ClientListCell
        
        cell.setClient(client: client)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let client = clients[indexPath.row]
        performSegue(withIdentifier: "MasterToDetail", sender: client)
    }
    
    
    
}







