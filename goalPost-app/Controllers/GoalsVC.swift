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
        fetchCoreDataObjects()
        tableView.reloadData()
    }
    
    func fetchCoreDataObjects(){
        self.fetchData { (complete) in
            if complete {
                if goals.count >= 1 {
                    tableView.isHidden = false
                }else {
                    tableView.isHidden = true
                }
            }
        }
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
    // we need 3 functions to make delete working
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true // just to let us for editing the row
    }

    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none// we don't need a style here because we are doing it
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "DELETE") { (rowAction, indexPath) in
            self.removeGoal(atIndexPath: indexPath)
            self.fetchCoreDataObjects()
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        deleteAction.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        
        return [deleteAction]
    }
    
}

// this extension to deal with coreData and fetching data
extension GoalsVC {
    func removeGoal(atIndexPath indexPath : IndexPath) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        managedContext.delete(goals[indexPath.row]) // this it's not enough to delete we have to tell the store to reload it self
        do{
            try managedContext.save()
            print("Successfully Deleted Goal")
        } catch {
            debugPrint("Could not remove : \(error.localizedDescription)")
        }
    }
    
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
