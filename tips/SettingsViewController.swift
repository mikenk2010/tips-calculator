//
//  SettingsViewController.swift
//  tips
//
//  Created by Bao Nguyen on 8/6/15.
//  Copyright (c) 2015 Bao Nguyen. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onPressDone(sender: AnyObject) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    
    @IBAction func onEditDefaultTip(sender: UISegmentedControl) {
        var defaultSelectTips = NSUserDefaults.standardUserDefaults()
        defaultSelectTips.setInteger(sender.selectedSegmentIndex, forKey: "select_default_tip_key")
        var defaultTipKey:NSInteger = defaultSelectTips.integerForKey("select_default_tip_key")
        println("Your default select key: \(defaultTipKey)")
        
        // Save
        defaultSelectTips.synchronize()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true);
        
        var defaultSelectTips = NSUserDefaults.standardUserDefaults()
        var defaultTipKey:NSInteger = defaultSelectTips.integerForKey("select_default_tip_key")
        println("Your default select key: \(defaultTipKey)")
    
        defaultTipControl.selectedSegmentIndex = defaultTipKey
      
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(defaultTipControl.selectedSegmentIndex, forKey: "select_default_tip_key")
        defaults.synchronize()
    }


}
