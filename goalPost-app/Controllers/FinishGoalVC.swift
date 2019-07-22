//
//  FinishGoalVC.swift
//  goalPost-app
//
//  Created by juger rash on 22.07.19.
//  Copyright © 2019 juger rash. All rights reserved.
//

import UIKit

class FinishGoalVC: UIViewController  , UITextFieldDelegate{

    // Outlets -:
    @IBOutlet weak var pointsTxtField: UITextField!
    @IBOutlet weak var createGoalBtn: UIButton!
    
    // Variables -:
    var goalDescription : String!
    var type : GoalType!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createGoalBtn.bindToKeyboard()
        pointsTxtField.delegate = self
    }
    
    // Actions -:
    @IBAction func createGoalBtnPressed(_ sender: Any) {
        if pointsTxtField.text != "" {
            self.save { (sucess) in
                if sucess{
                    dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
    // Functions -:
    func initDetail(description : String , type : GoalType){
        self.goalDescription = description
        self.type = type
    }
    @IBAction func backBtnPressed(_ sender: Any) {
        dismissDetail()
    }
    
    func save(completion : (_ finished : Bool) -> ()){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        let goal = Goal(context: managedContext)
        
        goal.goalDescription = self.goalDescription
        goal.goalType = type.rawValue
        goal.goalCompletionValue = Int32(pointsTxtField.text!)!
        goal.goalProgress = Int32(0)
        
        do {
            try managedContext.save()
            print("Completely saved")
            completion(true)
        } catch {
            debugPrint("Could not save : \(error.localizedDescription)")
            completion(false)
        }
    }
    

}
