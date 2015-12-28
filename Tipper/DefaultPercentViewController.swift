//
//  DefaultPercentViewController.swift
//  Tipper
//
//  Created by Akshat Goyal on 12/24/15.
//  Copyright © 2015 Akshat Goyal. All rights reserved.
//

import Foundation
import UIKit

var arr = [0.15, 0.20, 025]

class DefaultPercentViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Default"
        let defaults = NSUserDefaults.standardUserDefaults()
        arr[0] = defaults.doubleForKey("percentone")
        arr[1] = defaults.doubleForKey("percenttwo")
        arr[2] = defaults.doubleForKey("percentthree")
        segmentdefualt.selectedSegmentIndex = defaults.integerForKey("defaultindex")
        arr[2] = defaults.doubleForKey("percentthree")
        let p1 = String(arr[0] * 100)
        segmentdefualt.setTitle(p1 + "%", forSegmentAtIndex: 0)
        let p2 = String(arr[1] * 100)
        segmentdefualt.setTitle(p2 + "%", forSegmentAtIndex: 1)
        let p3 = String(arr[2] * 100)
        segmentdefualt.setTitle(p3 + "%", forSegmentAtIndex: 2)
    }
    
    @IBOutlet weak var segmentdefualt: UISegmentedControl!
    
    @IBAction func setDefault(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        let defaultselected = segmentdefualt.selectedSegmentIndex
        defaults.setInteger(defaultselected, forKey: "defaultindex")
    }
}