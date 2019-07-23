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
    @IBOutlet weak var completionView: UIView!
    
    
    // Functions -:
    func configureCell(goal : Goal) {
        self.descriptionLbl.text = goal.goalDescription
        self.typeLbl.text = goal.goalType
        self.progressLbl.text = String(describing: goal.goalProgress)
        
        if goal.goalProgress == goal.goalCompletionValue {
            self.completionView.isHidden = false
        }else {
            self.completionView.isHidden = true
        }
        
    }

}
