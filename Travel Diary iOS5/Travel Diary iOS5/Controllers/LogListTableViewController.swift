//
//  LogListTableViewController.swift
//  Travel Diary iOS5
//
//  Created by Milo Kvarfordt on 6/1/23.
//

import UIKit

class LogListTableViewController: UITableViewController {
    // MARK: - Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return LogController.sharedInstance.logs.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "logCell", for: indexPath)
        
        let log = LogController.sharedInstance.logs[indexPath.row]
        
        var config = cell.defaultContentConfiguration()
        config.text = log.logTitle
        config.secondaryText = log.logDate.asString()
        cell.contentConfiguration = config
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let log = LogController.sharedInstance.logs[indexPath.row]
            LogController.sharedInstance.delete(log: log)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            if let indexPath = tableView.indexPathForSelectedRow {
                if let destination = segue.destination as? LogDetailViewController {
                    let log = LogController.sharedInstance.logs[indexPath.row]
                    destination.log = log
                }
            }
        }
    }
}
