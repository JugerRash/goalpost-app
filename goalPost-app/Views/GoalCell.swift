//
//  GoalCell.swift
//  goalPost-app
//
//  Created by juger rash on 20.07.19.
//  Copyright © 2019 juger rash. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {

    // Outlets -:
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var progressLbl: UILabel!
    
    
    // Functions -:
    func configureCell(description : String , type : String , progress : Int) {
        self.descriptionLbl.text = description
        self.typeLbl.text = type
        self.progressLbl.text = String(describing: progress)
    }

}
