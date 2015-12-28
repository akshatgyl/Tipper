//
//  ChangeCurrencyViewController.swift
//  Tipper
//
//  Created by Akshat Goyal on 12/24/15.
//  Copyright © 2015 Akshat Goyal. All rights reserved.
//

import Foundation
import UIKit

class ChangeCurrencyViewController: UIViewController, UITableViewDelegate {
    
    var countires = ["Afghanistan", "Argentina", "Australia", "Azerbaijan", "Brazil", "Canada", "China", "Costa Rica", "Czech Republic", "Egypt", "India", "Japan", "Korea (North)", "Korea (South)", "Mexico", "Pakistan", "Qatar", "United Kingdom", "United States", "Viet Nam", "Yemen", "Zimbabwe"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Country"
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countires.count
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell  {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "percent")
        cell.textLabel!.text = countires[indexPath.row]
        let defaults = NSUserDefaults.standardUserDefaults()
        let lastSelectedIndexPath = defaults.integerForKey("countryindex")
        cell.accessoryType = (lastSelectedIndexPath == indexPath.row) ? .Checkmark : .None
        if (indexPath.row % 2 == 0) {
            cell.backgroundColor = UIColor(red: 185.0/255, green: 255.0/255, blue: 204.0/255, alpha: 1.0)
        } else {
            cell.backgroundColor = UIColor(red: 59.0/255, green: 59.0/255, blue: 59.0/255, alpha: 1.0)
            cell.textLabel?.textColor = UIColor.whiteColor()
        }
        return cell

    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(indexPath.row, forKey: "countryindex")
        if (indexPath.row == 0) {
            defaults.setObject("؋", forKey: "currency")
        } else if (indexPath.row == 1) {
            defaults.setObject("$", forKey: "currency")
        } else if (indexPath.row == 2) {
            defaults.setObject("$", forKey: "currency")
        } else if (indexPath.row == 3) {
            defaults.setObject("ман", forKey: "currency")
        } else if (indexPath.row == 4) {
            defaults.setObject("R$", forKey: "currency")
        } else if (indexPath.row == 5) {
            defaults.setObject("$", forKey: "currency")
        } else if (indexPath.row == 6) {
            defaults.setObject("¥", forKey: "currency")
        } else if (indexPath.row == 7) {
            defaults.setObject("₡", forKey: "currency")
        } else if (indexPath.row == 8) {
            defaults.setObject("Kč", forKey: "currency")
        } else if (indexPath.row == 9) {
            defaults.setObject("£", forKey: "currency")
        } else if (indexPath.row == 10) {
            defaults.setObject("₹", forKey: "currency")
        } else if (indexPath.row == 11) {
            defaults.setObject("¥", forKey: "currency")
        } else if (indexPath.row == 12) {
            defaults.setObject("₩", forKey: "currency")
        } else if (indexPath.row == 13) {
            defaults.setObject("₩", forKey: "currency")
        } else if (indexPath.row == 14) {
            defaults.setObject("$", forKey: "currency")
        } else if (indexPath.row == 15) {
            defaults.setObject("Rs", forKey: "currency")
        } else if (indexPath.row == 16) {
            defaults.setObject("﷼", forKey: "currency")
        } else if (indexPath.row == 17) {
            defaults.setObject("£", forKey: "currency")
        } else if (indexPath.row == 18) {
            defaults.setObject("$", forKey: "currency")
        } else if (indexPath.row == 19) {
            defaults.setObject("₫", forKey: "currency")
        } else if (indexPath.row == 20) {
            defaults.setObject("﷼", forKey: "currency")
        } else if (indexPath.row == 21) {
            defaults.setObject("Z$", forKey: "currency")
        }
        
        
        navigationController!.popViewControllerAnimated(true)
    }
    
    
    
}