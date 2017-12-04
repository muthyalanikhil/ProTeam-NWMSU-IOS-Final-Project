//
//  ProjectTableViewController.swift
//  ProTeam
//
//  Created by Muthyala,Nikhil on 11/2/17.
//  Copyright © 2017 Picklo,Blake H. All rights reserved.
//

import UIKit

class ProjectTableViewController: UITableViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated:Bool){
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ProjectsList.numProjects()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "project_cell", for: indexPath)
        let project = ProjectsList.projectNum(indexPath.row)
        cell.textLabel?.text = project.name
        cell.detailTextLabel?.text = "Start Date: \(project.startDate)"
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "project_detail" {
            let projectVC = segue.destination as! ProjectDetailsViewController
            projectVC.project = ProjectsList.projects[(tableView.indexPathForSelectedRow?.row)!]
        }
    }
}
