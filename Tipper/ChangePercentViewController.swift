//
//  ChangePercentViewController.swift
//  Tipper
//
//  Created by Akshat Goyal on 12/24/15.
//  Copyright © 2015 Akshat Goyal. All rights reserved.
//

import Foundation
import UIKit

class ChangePercentViewController : UIViewController {
    var arr = [0.15, 0.20, 0.25]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tip Percentage"
        self.percent1Textfield.becomeFirstResponder()
        let defaults = NSUserDefaults.standardUserDefaults()
        arr[0] = defaults.doubleForKey("percentone")
        arr[1] = defaults.doubleForKey("percenttwo")
        arr[2] = defaults.doubleForKey("percentthree")
        segmentdisplay.selectedSegmentIndex = defaults.integerForKey("defaultindex")
        arr[2] = defaults.doubleForKey("percentthree")
        let p1 = String(arr[0] * 100)
        segmentdisplay.setTitle(p1 + "%", forSegmentAtIndex: 0)
        let p2 = String(arr[1] * 100)
        segmentdisplay.setTitle(p2 + "%", forSegmentAtIndex: 1)
        let p3 = String(arr[2] * 100)
        segmentdisplay.setTitle(p3 + "%", forSegmentAtIndex: 2)
    }
    
    @IBOutlet weak var segmentdisplay: UISegmentedControl!
    @IBOutlet weak var percent3Textfield: UITextField!
    @IBOutlet weak var percent2Textfield: UITextField!
    @IBOutlet weak var percent1Textfield: UITextField!
    @IBAction func setupOne(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble(NSString(string :percent1Textfield.text!).doubleValue / 100, forKey: "percentone")
        defaults.synchronize()
        percent1Textfield.text = ""
        viewDidLoad()
    }
    @IBAction func setuptwo(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble(NSString(string :percent2Textfield.text!).doubleValue / 100, forKey: "percenttwo")
        defaults.synchronize()
        percent2Textfield.text = ""
        viewDidLoad()
    }
    @IBAction func setupthree(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble(NSString(string :percent3Textfield.text!).doubleValue / 100, forKey: "percentthree")
        defaults.synchronize()
        percent3Textfield.text = ""
        viewDidLoad()
    }
    @IBAction func changeDefault(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        let defaultselected = segmentdisplay.selectedSegmentIndex
        defaults.setInteger(defaultselected, forKey: "defaultindex")
    }
}
