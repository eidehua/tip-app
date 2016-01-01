//
//  SettingsViewController.swift
//  tips
//
//  Created by Edward Xue on 12/31/15.
//  Copyright © 2015 eidehua. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    @IBOutlet weak var tipField: UITextField!
    let defaults = NSUserDefaults.standardUserDefaults()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        // This is a good place to retrieve the default tip percentage from NSUserDefaults
        // and use it to update the tip amount
        let tipIndex = defaults.integerForKey("default_tip_index") //defaults to 0
        defaultTipControl.selectedSegmentIndex = tipIndex
    
        updateTipSegments()
        //Update the text field with current selected default tip amount
        let tipPercentage = defaultTipControl.titleForSegmentAtIndex(tipIndex)! //eg 18%, and make sure its not optional
        print(tipPercentage)
        let tipNumber = String(tipPercentage.characters.dropLast())
        tipField.text = tipNumber
    }
    
    func updateTipSegments(){
        //Update default tip value that shows up.
        let tipPercentages = defaults.arrayForKey("default_tip_percentages")
        for i in 0...2 { //0,1,2
            let tipPercentage = (tipPercentages![i]) as! NSNumber
            let tipStringPercentage = "\(tipPercentage)%" //lets me string this NSNumber
            defaultTipControl.setTitle(tipStringPercentage, forSegmentAtIndex: i)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    @IBAction func onDefaultChanged(sender: AnyObject) {
       let index = defaultTipControl.selectedSegmentIndex
        defaults.setInteger(index, forKey: "default_tip_index")
        
        //Update the text field with current selected default tip amount
        let tipPercentage = defaultTipControl.titleForSegmentAtIndex(index)! //eg 18%
        let tipNumber = String(tipPercentage.characters.dropLast())
        tipField.text = tipNumber
    }
    
    //This is for the text field, and will be called on value changed
    @IBAction func onUpdateTip(sender: AnyObject) {
        let tipNumber =  tipField.text!
        let tipDouble = NSString(string: tipNumber).doubleValue // I cant let tipPercentage which is a String? = a double
        let tipInt = NSString(string: tipNumber).integerValue
        let tipStringPercentage = tipNumber + "%" //eg 18%
        let tipFraction = tipDouble/100.0 //eg .18
        
        //Update default tip value that shows up.
        defaultTipControl.setTitle(tipStringPercentage, forSegmentAtIndex: defaultTipControl.selectedSegmentIndex)
        
        //update the array
        var tipPercentages = defaults.arrayForKey("default_tip_percentages")
        tipPercentages![defaultTipControl.selectedSegmentIndex] = (tipInt)
        defaults.setValue(tipPercentages, forKey: "default_tip_percentages")
        
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}
