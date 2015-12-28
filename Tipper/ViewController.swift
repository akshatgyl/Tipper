//
//  ViewController.swift
//  Tipper
//
//  Created by Akshat Goyal on 12/4/15.
//  Copyright © 2015 Akshat Goyal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {



    @IBOutlet weak var billText: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var segmentSelected: UISegmentedControl!
    internal var arr = [0.15, 0.20, 0.25]
    var segmentPressed : Int = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.billText.becomeFirstResponder()
        self.title = "Tipper"
        let defaults = NSUserDefaults.standardUserDefaults()
        if (defaults.objectForKey("currency") == nil) {
            performSegueWithIdentifier("settings", sender: self)
            defaults.setObject("$", forKey: "currency")
        }
        arr[0] = defaults.doubleForKey("percentone")
        arr[1] = defaults.doubleForKey("percenttwo")
        arr[2] = defaults.doubleForKey("percentthree")
        let p1 = String(arr[0] * 100)
        segmentSelected.setTitle(p1 + "%", forSegmentAtIndex: 0)
        let p2 = String(arr[1] * 100)
        segmentSelected.setTitle(p2 + "%", forSegmentAtIndex: 1)
        let p3 = String(arr[2] * 100)
        segmentSelected.setTitle(p3 + "%", forSegmentAtIndex: 2)
    
        billText.attributedPlaceholder = NSAttributedString(string: defaults.objectForKey("currency") as! String)
        tipLabel.attributedText = NSAttributedString(string: defaults.objectForKey("currency") as! String + "0.00")
        segmentSelected.selectedSegmentIndex = defaults.integerForKey("defaultindex")
        tipLabel.adjustsFontSizeToFitWidth = true
        totalLabel.adjustsFontSizeToFitWidth = true
        twoLabel.adjustsFontSizeToFitWidth = true
        threeLabel.adjustsFontSizeToFitWidth = true
        fourLabel.adjustsFontSizeToFitWidth = true
        fiveLabel.adjustsFontSizeToFitWidth = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.billText.becomeFirstResponder()
        let defaults = NSUserDefaults.standardUserDefaults()
        arr[0] = defaults.doubleForKey("percentone")
        arr[1] = defaults.doubleForKey("percenttwo")
        arr[2] = defaults.doubleForKey("percentthree")
        let p1 = String(arr[0] * 100)
        segmentSelected.setTitle(p1 + "%", forSegmentAtIndex: 0)
        let p2 = String(arr[1] * 100)
        segmentSelected.setTitle(p2 + "%", forSegmentAtIndex: 1)
        let p3 = String(arr[2] * 100)
        segmentSelected.setTitle(p3 + "%", forSegmentAtIndex: 2)
        billText.attributedPlaceholder = NSAttributedString(string: defaults.objectForKey("currency") as! String)
        segmentSelected.selectedSegmentIndex = defaults.integerForKey("defaultindex")
        onChange(self)
    }
    @IBOutlet weak var twoLabel: UILabel!
    @IBOutlet weak var threeLabel: UILabel!
    @IBOutlet weak var fourLabel: UILabel!
    @IBOutlet weak var fiveLabel: UILabel!
    

    @IBAction func onChange(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        segmentPressed = segmentSelected.selectedSegmentIndex
        let tipPercentage = arr[segmentPressed]
        let bill : Double = NSString(string: billText.text!).doubleValue
        
        let tipAmount = bill * tipPercentage
        tipLabel.text = String(format: defaults.objectForKey("currency") as! String + "%.2f", tipAmount)
        
        let total = bill + tipAmount
        totalLabel.text = String(format: defaults.objectForKey("currency") as! String + "%.2f", total)
        
        let twoPeople = total / 2
        twoLabel.text = String(format: defaults.objectForKey("currency") as! String + "%.2f", twoPeople)
        
        let threePeople = total / 3
        threeLabel.text = String(format: defaults.objectForKey("currency") as! String + "%.2f", threePeople)
        
        let fourPeople = total / 4
        fourLabel.text = String(format: defaults.objectForKey("currency") as! String + "%.2f", fourPeople)
        
        let fivePeople = total / 5
        fiveLabel.text = String(format: defaults.objectForKey("currency") as! String + "%.2f", fivePeople)
        
    }
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBAction func whenPressed(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }


}

