//
//  ViewController.swift
//  IRDB_JL
//
//  Created by Julio Lopez on 10/27/20.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var mediaImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var yearFoundedLabel: UILabel!
    @IBOutlet var styleLabel: UILabel!
    @IBOutlet var totalWinsLabel: UILabel!
    @IBOutlet var topShowLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var summaryLabel: UITextView!

    
    var detailItem: GroupEntries? {
        didSet {
            // Update the view
            configureView()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Set the color of the title
        let nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.black
        nav?.tintColor = UIColor.init(red: 245/255, green: 196/255, blue: 72/255, alpha: 1)
        
        title = detailItem?.orgName
        
        configureView()
    }
    
    func configureView() {   
        if let CorpEntries = detailItem {
            
            // Getting and setting the image to display
            if let thisMediaImage = mediaImage {
                // do thing
                let url = URL(string: CorpEntries.groupImage)
                let data = try? Data(contentsOf: url!)
                thisMediaImage.image = UIImage(data: data!)
            }
            
            if let thisTitleLabel = titleLabel{
                thisTitleLabel.text = CorpEntries.orgName
            }
            
            if let thisYearLabel = yearFoundedLabel {
                thisYearLabel.text = "Est. \(CorpEntries.yearFounded)"
            }

            if let thisFormatLabel = styleLabel {
                thisFormatLabel.text = CorpEntries.style
            }
            
            if let thisWinsLabel = totalWinsLabel {
                if(CorpEntries.totalWins == 0) {
                    thisWinsLabel.text = ""
                }
                else if(CorpEntries.totalWins == 1) {
                    thisWinsLabel.text = "\(CorpEntries.totalWins ?? 0) World Championship"
                }
                else {
                    thisWinsLabel.text = "\(CorpEntries.totalWins ?? 0) World Championships"
                }
            }
            if let thisStudioLabel = topShowLabel {
                thisStudioLabel.text = CorpEntries.topShow
            }
            
            // Longer Bottom view labels
            if let thisLocationLabel = locationLabel {
                thisLocationLabel.text = "  \(CorpEntries.groupLocation)"
            }
            if let thisSummaryLabel = summaryLabel {
                thisSummaryLabel.text = CorpEntries.groupSummary
            }
        }
    }
    
    // TODO 
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showCorpsList" {
            let controller = segue.destination as! CastTableViewController
            controller.staffArray = detailItem?.groupStaff
        }
    }

}

