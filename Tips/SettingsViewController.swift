//
//  SettingsViewController.swift
//  Tips
//
//  Created by Lainie Wright on 12/14/15.
//  Copyright © 2015 lainiewright. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var tipControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        let defaults = NSUserDefaults.standardUserDefaults()
        let selectedIndex = defaults.integerForKey("default_tip_percentage")
        tipControl.selectedSegmentIndex = selectedIndex
    }
    
    override func viewWillDisappear(animated: Bool) {
        let defaults = NSUserDefaults.standardUserDefaults()
        let index = tipControl.selectedSegmentIndex
        defaults.setInteger(index, forKey: "default_tip_percentage")
        defaults.synchronize()
    }

}
