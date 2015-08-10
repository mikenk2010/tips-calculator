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
    @IBOutlet weak var billFieldLabel: UILabel!
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipTitle: UILabel!
    @IBOutlet weak var lineLabel: UIView!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var totalLabel2: UILabel!
    
    @IBOutlet weak var totalTitle: UILabel!
    @IBOutlet weak var segmentLabel: UISegmentedControl!
    
    
    // x and y
    let billAmountUnfocusedBox = CGRect(x: 155, y: 102, width: 140, height: 30)
    let billAmountFieldUnfocusedBox = CGRect(x: 22, y: 102, width: 135, height: 24)
    
    let billAmountFocusedBox = CGRect(x: 155, y: 150, width: 140, height: 30)
    let billAmountFieldFocusedBox = CGRect(x: 22, y: 150, width: 135, height: 24)
    
    
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Return current select format in Settings
    var currFormat: NSNumberFormatter {
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        return formatter
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // get onChange when textfield press
    @IBAction func onEditingChanged(sender: AnyObject) {
        self.calTips()
    }
    
    // hide keyboard when touch everywhere on screen
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    
    
    
    func calTips(){
        println("User editing bill")
        
        var tipPercentages = [0.18,0.2,0.22]
        
        if(billField.hasText()){
            self.showViews()
        }else{
            self.hideViews()
        }
        
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = (billField.text as NSString).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = currFormat.stringFromNumber(tip)
        totalLabel.text = currFormat.stringFromNumber(total)
    }
    
    // for testing
    func viewCurlUp(view: UIView, animationTime: Float){
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationCurve(UIViewAnimationCurve.EaseInOut)
        UIView.setAnimationDuration(NSTimeInterval (animationTime))
        
        UIView.setAnimationTransition(UIViewAnimationTransition.CurlUp, forView: view, cache: false)
        UIView.commitAnimations()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true);
        
        //  self.viewCurlUp(baoTest, animationTime: 10.0)
        
        var defaultSelectTips = NSUserDefaults.standardUserDefaults()
        var defaultTipKey = defaultSelectTips.integerForKey("select_default_tip_key")
        println("You select key: \(defaultTipKey)")
        
        // Focus on textfield
        [billField .becomeFirstResponder()]
        
        tipControl.selectedSegmentIndex = defaultTipKey
        
        // Cal Tips Again
        calTips()
    }
    
    func showViews() {
        UIView.animateKeyframesWithDuration(0.5, delay: 0, options: .CalculationModeCubic, animations: {
            UIView.addKeyframeWithRelativeStartTime(0.1, relativeDuration: 0.4) {
                self.billField.frame = self.billAmountUnfocusedBox
                self.billFieldLabel.frame = self.billAmountFieldUnfocusedBox
                
            }
            }, completion: nil)
        
        UIView.animateWithDuration(0.4, animations: {
            self.tipLabel.alpha = 1
            self.tipLabel.alpha = 1
            self.tipControl.alpha = 1
            self.totalLabel.alpha = 1
            self.totalTitle.alpha = 1
            self.tipTitle.alpha = 1
        })
    }
    
    func hideViews() {
        UIView.animateKeyframesWithDuration(0.5, delay: 0, options: .CalculationModeCubic, animations: {
            UIView.addKeyframeWithRelativeStartTime(0.1, relativeDuration: 0.4) {
                self.billField.frame = self.billAmountFocusedBox
                self.billFieldLabel.frame = self.billAmountFieldFocusedBox
            }
            }, completion: nil)
        
        UIView.animateWithDuration(0.4, animations: {
            self.tipLabel.alpha = 0
            self.tipControl.alpha = 0
            self.totalLabel.alpha = 0
            self.tipLabel.alpha = 0
            self.totalTitle.alpha = 0
            self.tipTitle.alpha = 0
        })
    }
}

