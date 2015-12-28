//
//  SettingsViewController.swift
//  Tipper
//
//  Created by Akshat Goyal on 12/24/15.
//  Copyright © 2015 Akshat Goyal. All rights reserved.
//

import Foundation
import UIKit

class SettingsViewController : UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Settings"
        tableview.backgroundColor = UIColor(red: 59.0/255, green: 59.0/255, blue: 59.0/255, alpha: 1.0)
    }
    
    
    var cellContent = ["Set Custom/Default Percentages", "Change Currency", "Call an Uber"]
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellContent.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "percent")
        cell.textLabel!.text = cellContent[indexPath.row]
        if (indexPath.row % 2 == 0) {
            cell.backgroundColor = UIColor(red: 185.0/255, green: 255.0/255, blue: 204.0/255, alpha: 1.0)
        } else {
            cell.backgroundColor = UIColor(red: 59.0/255, green: 59.0/255, blue: 59.0/255, alpha: 1.0)
            cell.textLabel?.textColor = UIColor.whiteColor()
        }
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if (indexPath.row == 0) {
            performSegueWithIdentifier("percentagesegue", sender: self)
        } else if (indexPath.row == 1) {
            performSegueWithIdentifier("currencysegue", sender: self)
        } else {
            UIApplication.sharedApplication().openURL(NSURL(string: "https://www.uber.com")!)
        }
        tableview.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
}
