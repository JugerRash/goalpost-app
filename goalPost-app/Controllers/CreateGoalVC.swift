//
//  CreateGoalVC.swift
//  goalPost-app
//
//  Created by juger rash on 21.07.19.
//  Copyright © 2019 juger rash. All rights reserved.
//

import UIKit

class CreateGoalVC: UIViewController {

    // Outlets -:
    @IBOutlet weak var goalTxtView: UITextView!
    @IBOutlet weak var shortTermBtn: UIButton!
    @IBOutlet weak var longTermBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // Actions -:
    @IBAction func backBtnPressed(_ sender: Any) {
        dismissDetail()
    }
    @IBAction func shortTermBtnPressed(_ sender: Any) {
    }
    @IBAction func longTermBtnPressed(_ sender: Any) {
    }
    @IBAction func nextBtnPressed(_ sender: Any) {
    }
    


}
