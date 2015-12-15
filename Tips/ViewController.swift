//
//  ViewController.swift
//  Tips
//
//  Created by Lainie Wright on 12/14/15.
//  Copyright © 2015 lainiewright. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onEditingChanged(sender: AnyObject) {
        let tipPercentages = [0.18, 0.2, 0.22]
        let percentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * percentage
        let total = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f", arguments: [tip])
        totalLabel.text = String(format: "$%.2f", arguments: [total])
        
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

