//
//  GoalsVC.swift
//  goalPost-app
//
//  Created by juger rash on 19.07.19.
//  Copyright © 2019 juger rash. All rights reserved.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as? AppDelegate // wee need this to create an variable of managedContext to deal with coreData

class GoalsVC: UIViewController {

    // Outlets -:
    @IBOutlet weak var tableView: UITableView!
    
    //Variables -:
    var goals : [Goal] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.fetchData { (complete) in
            if complete {
                if goals.count >= 1 {
                    tableView.isHidden = false
                }else {
                    tableView.isHidden = true
                }
            }
        }
        tableView.reloadData()
    }

    // Actions -:
    @IBAction func addGoalBtnPressed(_ sender: Any) {
        guard let createGoalVC  = storyboard?.instantiateViewController(withIdentifier: "CreateGoalVC") else { return }
        presentDetail(createGoalVC)
    }
    
}

extension GoalsVC : UITableViewDelegate , UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell", for: indexPath) as? GoalCell else { return GoalCell() }
        let goal = goals[indexPath.row]
        cell.configureCell(goal: goal)
        return cell
    }
}

// this extension to deal with coreData and fetching data
extension GoalsVC {
    func fetchData(completion : (_ completion : Bool) -> ()){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        
        let fetchRequest = NSFetchRequest<Goal>(entityName: "Goal") // to fetch data from the store and we should pass the name of the entity
        do {
            goals = try managedContext.fetch(fetchRequest)
            completion(true)
            print("Successfully fetched data")
        } catch {
            debugPrint("Could not fetching : \(error.localizedDescription)")
            completion(false)
        }
        
    }
}
