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
    @IBOutlet var descriptionTextView: UILabel!

    
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
    }
    
    func configureView() {
        titleLabel.text = detailItem?.name
        yearLabel.text = detailItem?.yearStart
        
        if let entry = detailItem {
            if let thisTitleLabel = titleLabel{
                thisTitleLabel.text = entry.name
            }
            if let thisYearLabel = yearLabel {
                thisYearLabel.text = entry.yearStart
            }
        }
    }

}

