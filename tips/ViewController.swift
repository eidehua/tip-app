//
//  ViewController.swift
//  tips
//
//  Created by Edward Xue on 12/30/15.
//  Copyright © 2015 eidehua. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    let defaults = NSUserDefaults.standardUserDefaults()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        // This is a good place to retrieve the default tip percentage from NSUserDefaults
        // and use it to update the tip amount
        let tipIndex = defaults.integerForKey("default_tip_index") //defaults to 0
        tipControl.selectedSegmentIndex = tipIndex
        
        var tipPercentages = defaults.arrayForKey("default_tip_percentages")
        print(tipPercentages)
        if tipPercentages == nil {
            tipPercentages = [18, 20, 22]
            defaults.setValue(tipPercentages, forKey: "default_tip_percentages")
        }
        updateTips()
        updateTipSegments()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        updateTips()
    }
    
    func updateTips(){
        let tipPercentages = defaults.arrayForKey("default_tip_percentages")
        let tipPercentage = tipPercentages![tipControl.selectedSegmentIndex] as! NSNumber
        let tipFraction = (tipPercentage as Double)/100.0
        
        let billAmount = NSString(string: billField.text!).doubleValue
        //looks kinda bad to me (doing the downcast to NSNumber than Double)
        let tip = billAmount * tipFraction
        let total = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    func updateTipSegments(){
        //Update default tip value that shows up.
        let tipPercentages = defaults.arrayForKey("default_tip_percentages")
        for i in 0...2 { //0,1,2
            
            let tipPercentage = (tipPercentages![i]) as! NSNumber
            let tipStringPercentage = "\(tipPercentage)%" //lets me string this NSNumber
            tipControl.setTitle(tipStringPercentage, forSegmentAtIndex: i)
        }
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }
}

