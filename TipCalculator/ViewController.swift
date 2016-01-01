//
//  ViewController.swift
//  TipCalculator
//
//  Created by Xiaoxi Zhang on 12/21/15.
//  Copyright © 2015 Xiaoxi Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipLable: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLable: UILabel!
    
    var defaultPer = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLable.text = "$0.00"
        totalLable.text = "$0.00"
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[defaultPer]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = NSString(string: billField.text!).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLable.text = "$\(tip)"
        totalLable.text = "$\(total)"
        
        tipLable.text = String(format: "$%.2f", tip)
        totalLable.text = String(format: "$%.2f",total)
    }

    @IBAction func onTap(sender: AnyObject) {
        
        view.endEditing(true)
    }
}

