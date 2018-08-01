//
//  ClientListCell.swift
//  RealTableViewPractice
//
//  Created by Corey McLaughlin on 6/14/18.
//  Copyright © 2018 Corey McLaughlin. All rights reserved.
//

import UIKit

class ClientListCell: UITableViewCell {

    @IBOutlet weak var clientName: UILabel!
    @IBOutlet weak var currentSessionsCompleted: UILabel!
    @IBOutlet weak var currentSessionsRemaining: UILabel!
    
    func setClient(client: Client) {
        clientName.text = "\(client.firstName) \(client.lastName)"
        currentSessionsCompleted.text = String(client.packages[0].sessionsRemaining)
        currentSessionsRemaining.text = String(client.packages[0].sessions)
    }
}
