//
//  GoalsVC.swift
//  goalPost-app
//
//  Created by juger rash on 19.07.19.
//  Copyright © 2019 juger rash. All rights reserved.
//

import UIKit

class GoalsVC: UIViewController {

    // Outlets -:
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
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
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell", for: indexPath) as? GoalCell else { return GoalCell() }
        cell.configureCell(description: "Eat salad twice a week", type: .shortTerm, progress: 2)
        return cell
    }
}
