//
//  SettingsViewController.swift
//  Tipper
//
//  Created by Akshat Goyal on 12/4/15.
//  Copyright © 2015 Akshat Goyal. All rights reserved.
//

import Foundation
import UIKit


class SettingsViewController : UIViewController {
    
    @IBOutlet weak var percent3Textfield: UITextField!
    @IBOutlet weak var percent2Textfield: UITextField!
    @IBOutlet weak var percent1Textfield: UITextField!
    @IBAction func setupOne(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble(NSString(string :percent1Textfield.text!).doubleValue / 100, forKey: "percentone")
        defaults.synchronize()
    }
    @IBAction func setuptwo(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble(NSString(string :percent2Textfield.text!).doubleValue / 100, forKey: "percenttwo")
        defaults.synchronize()
    }
    @IBAction func setupthree(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble(NSString(string :percent3Textfield.text!).doubleValue / 100, forKey: "percentthree")
        defaults.synchronize()
    }
}