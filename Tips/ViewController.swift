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
    @IBOutlet weak var ratioLabel: UILabel!
    @IBOutlet weak var bottomView: UIView!
    
    var selectedIndex:Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
        billField.becomeFirstResponder()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = NSUserDefaults.standardUserDefaults()
        selectedIndex = defaults.integerForKey("default_tip_percentage")
        tipControl.selectedSegmentIndex = selectedIndex
        calculateTip()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        let defaults = NSUserDefaults.standardUserDefaults()
        let index = tipControl.selectedSegmentIndex
        defaults.setInteger(index, forKey: "default_tip_percentage")
        defaults.synchronize()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func calculateTip() {
        let tipPercentages = [0.18, 0.2, 0.22]
        let percentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * percentage
        let total = billAmount + tip
        
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        formatter.maximumFractionDigits = 2;
        
        tipLabel.text = formatter.stringFromNumber(tip)
        totalLabel.text = formatter.stringFromNumber(total)
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        calculateTip()
        
        if billField.text!.isEmpty {
            self.bottomView.hidden = true
            self.tipControl.hidden = true
            
        } else {
            self.bottomView.hidden = false
            self.tipControl.hidden = false
            
        }
    }
    
}

