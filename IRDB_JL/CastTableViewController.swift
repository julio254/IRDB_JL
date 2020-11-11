//
//  CastTableViewController.swift
//  IRDB_JL
//
//  Created by Julio Lopez on 11/4/20.
//

import UIKit

class CastTableViewController: UITableViewController {
    
    var staffArray: [CorpStaff]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return staffArray?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "castCell", for: indexPath)

        // Configure the cell...
        
        //CAST LIST
        
        cell.textLabel!.text = "\(staffArray?[indexPath.row].staffMember ?? "")"
        
        let role = staffArray?[indexPath.row].staffRole
        print(role ?? "")
        
        cell.detailTextLabel?.text = staffArray?[indexPath.row].staffRole
        
        print (cell.detailTextLabel?.text ?? "")

        return cell
    }
    


}
