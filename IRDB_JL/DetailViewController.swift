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
    @IBOutlet var yearLabel: UILabel!
    @IBOutlet var formatLabel: UILabel!
    @IBOutlet var episodeLabel: UILabel!
    @IBOutlet var studioLabel: UILabel!
    @IBOutlet var summaryLabel: UILabel!
    @IBOutlet var summaryTextView: UILabel!

    
    var detailItem: Entry? {
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
        
        title = detailItem?.name
        
        configureView()
    }
    
    func configureView() {   
        if let entry = detailItem {
            
            // Getting and setting the image to display
            if let thisMediaImage = mediaImage {
                // do thing
                let url = URL(string: entry.imageURL)
                let data = try? Data(contentsOf: url!)
                thisMediaImage.image = UIImage(data: data!)
            }
            
            if let thisTitleLabel = titleLabel{
                thisTitleLabel.text = entry.name
            }
            
            if let thisYearLabel = yearLabel {
                if(entry.yearEnd == nil) {
                    thisYearLabel.text = entry.yearStart
                }
                else if(entry.yearEnd == " - ") {
                    thisYearLabel.text = entry.yearStart
                    thisYearLabel.text! += " - "
                }
                else {
                    thisYearLabel.text = entry.yearStart
                    thisYearLabel.text! += " - "
                    thisYearLabel.text! += entry.yearEnd!
                }
            }

            if let thisFormatLabel = formatLabel {
                thisFormatLabel.text = entry.format
            }
            
            if let thisEpisodeLabel = episodeLabel {
                if let episodeCount = entry.episodes {
                    if(episodeCount == 1) {
                        thisEpisodeLabel.text = "\(episodeCount) Episode"
                    }
                    else {
                        thisEpisodeLabel.text = "\(episodeCount) Episodes"
                    }
                }
                else {
                    thisEpisodeLabel.text = ""
                }
            }
            if let thisStudioLabel = studioLabel {
                if(entry.studio != nil) {
                    thisStudioLabel.text = entry.studio
                }
                else {
                    thisStudioLabel.text = ""
                }
            }
            if let thisSummaryLabel = summaryLabel {
                thisSummaryLabel.text = entry.description
            }
            if let thisSummaryTextView = summaryTextView {
                thisSummaryTextView.text = entry.summary
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showCastList" {
            let controller = segue.destination as! CastTableViewController
            controller.castListArray = detailItem?.starring
        }
    }

}

