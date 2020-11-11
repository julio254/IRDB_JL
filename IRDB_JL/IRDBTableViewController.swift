//
//  IRDBTableViewController.swift
//  IRDB_JL
//
//  Created by Julio Lopez on 10/27/20.
//

import UIKit

class IRDBTableViewController: UITableViewController {

    var mediaModel: DCiMediaModel? {
        didSet {
            tableView.reloadData()
        }
    }
    
    var dataController = DataController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Drum Corps"
        
        // 1
        let nav = self.navigationController?.navigationBar
          
        // 2
        nav?.barStyle = UIBarStyle.black
        nav?.tintColor = UIColor.init(red: 245/255, green: 196/255, blue: 72/255, alpha: 1)
          
        // 3
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 44))
        imageView.contentMode = .scaleAspectFit
              
        // 4
        let image = UIImage(named: "dciLogo")
        imageView.image = image
              
        // 5
        navigationItem.titleView = imageView
        
        // Call dataController
        dataController.getJSONData(completion: {detailModel in self.mediaModel = detailModel})
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return mediaModel?.dciGroup.count ?? 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mediaModel?.dciGroup[section].groupEntries.count ?? 0
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return mediaModel?.dciGroup[section].groupName
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mediaCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = mediaModel?.dciGroup[indexPath.section].groupEntries[indexPath.row].orgName
        cell.detailTextLabel?.text = mediaModel?.dciGroup[indexPath.section].groupEntries[indexPath.row].yearFounded

        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "showCorpsDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let selectedObject = mediaModel!.dciGroup[indexPath.section].groupEntries[indexPath.row]
                let controller = segue.destination as! DetailViewController
                controller.detailItem = selectedObject
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }
}
