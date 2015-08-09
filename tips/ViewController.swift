//
//  ViewController.swift
//  tips
//
//  Created by Bao Nguyen on 8/4/15.
//  Copyright (c) 2015 Bao Nguyen. All rights reserved.
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
        calTips()
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    func calculate(billAmount:Double, tipPercentage:Double){
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        tipLabel.text = String(format: "$%.2f", tip);
        totalLabel.text = String(format: "$%.2f", total)
        //tipPercentageLabel.text=String(format: "%d%%", Int(tipPercentage*100));
    }
    
    func getDefaultTipPercentage(){
        var defaults = NSUserDefaults.standardUserDefaults()
        var intValue = defaults.integerForKey("tip_percentage")
        if(intValue<=0){
            intValue = 18
        }
        //println(NSString(format:"%.2f", tipPercentage))
    }
    
    func calTips(){
        println("User editing bill")
        
        var tipPercentages = [0.18,0.2,0.22]
        
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = (billField.text as NSString).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f ", tip)
        totalLabel.text = String(format: "$%.2f", total)

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true);
        
        var defaultSelectTips = NSUserDefaults.standardUserDefaults()
        var defaultTipKey = defaultSelectTips.integerForKey("select_default_tip_key")
        println("You select key: \(defaultTipKey)")
        
        
        
        tipControl.selectedSegmentIndex = defaultTipKey
        
        // Cal Tips Again
        calTips()
    }
    

}

