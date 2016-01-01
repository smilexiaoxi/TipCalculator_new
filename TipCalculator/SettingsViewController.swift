//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Xiaoxi Zhang on 12/21/15.
//  Copyright © 2015 Xiaoxi Zhang. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController{
    
    let userDefaults = NSUserDefaults.standardUserDefaults()

    @IBOutlet weak var segPercentage: UISegmentedControl!
    /*var SelectPer: Int!*/
    
    @IBAction func actPercentage(sender: UISegmentedControl) {
        print(segPercentage.selectedSegmentIndex)
        /*SelectPer = segPercentage.selectedSegmentIndex*/
    }

    @IBAction func btnSave(sender: UIButton) {
        let SaveSelectPer = segPercentage.selectedSegmentIndex
        userDefaults.setInteger(SaveSelectPer, forKey: "UserSelectPercentage")
        userDefaults.synchronize()
        print("save\n")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var SaveSelectPer: Int? = userDefaults.integerForKey("UserSelectPercentage") as Int?
        if(SaveSelectPer == nil) {
            SaveSelectPer = 1
            userDefaults.setInteger(SaveSelectPer!, forKey: "UserSelectPercentage")
        }
        
        func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            let DestViewController : ViewController = segue.destinationViewController as! ViewController
            DestViewController.defaultPer = userDefaults.integerForKey("UserSelectPercentage")
            print("action\n")
        }
        
        /*SelectPer = segPercentage.selectedSegmentIndex
        
        SelectPer = userDefaults.integerForKey("UserSelectPersentage")*/
        
        // Do any additional setup after loading the view.
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

}
