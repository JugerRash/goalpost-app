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
    @IBOutlet weak var nextBtn: UIButton!
    
    // Variables -:
    var goalType : GoalType = .shortTerm
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextBtn.bindToKeyboard()
        shortTermBtn.setSelectedButton()
        longTermBtn.setDeselectedButton()
        goalTxtView.delegate = self
    }
    
    // Actions -:
    @IBAction func backBtnPressed(_ sender: Any) {
        dismissDetail()
    }
    @IBAction func shortTermBtnPressed(_ sender: Any) {
        goalType = .shortTerm
        shortTermBtn.setSelectedButton()
        longTermBtn.setDeselectedButton()
    }
    @IBAction func longTermBtnPressed(_ sender: Any) {
        goalType = .longTerm
        shortTermBtn.setDeselectedButton()
        longTermBtn.setSelectedButton()
    }
    @IBAction func nextBtnPressed(_ sender: Any) {
        if goalTxtView.text != "" && goalTxtView.text != "What is your goal?" {
            guard let finishGoalVC = storyboard?.instantiateViewController(withIdentifier: "FinishGoalVC") as? FinishGoalVC else { return }
            finishGoalVC.initDetail(description: goalTxtView.text!, type: goalType)
            presentingViewController?.presentSecondryDetail(finishGoalVC)
        }
    }
}


extension CreateGoalVC : UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        goalTxtView.text = ""
        goalTxtView.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
}
