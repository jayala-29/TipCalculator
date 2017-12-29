//
//  ViewController.swift
//  TipCalculator
//
//  Created by Jessy Ayala on 12/26/17.
//  Copyright © 2017 Jessy Ayala. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var customTipField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel1: UILabel!
    @IBOutlet weak var totalLabel2: UILabel!
    @IBOutlet weak var totalLabel3: UILabel!
    @IBOutlet weak var totalLabel4: UILabel!
    @IBOutlet weak var dollarsign11: UIImageView!
    @IBOutlet weak var dollarsign12: UIImageView!
    @IBOutlet weak var dollarsign13: UIImageView!
    @IBOutlet weak var dollarsign14: UIImageView!
    @IBOutlet weak var dollarsign21: UIImageView!
    @IBOutlet weak var dollarsign22: UIImageView!
    @IBOutlet weak var dollarsign23: UIImageView!
    @IBOutlet weak var dollarsign24: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Tip Calculator"
        billField.becomeFirstResponder()
        customTipField.isHidden = true
        dollarsign12.isHidden = true
        dollarsign21.isHidden = true
        dollarsign13.isHidden = true
        dollarsign24.isHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        
        if (dollarsign12.isHidden == true) {
            dollarsign11.isHidden = true
            dollarsign12.isHidden = false
            dollarsign13.isHidden = false
            dollarsign14.isHidden = true
            dollarsign21.isHidden = false
            dollarsign22.isHidden = true
            dollarsign23.isHidden = true
            dollarsign24.isHidden = false
        } else {
            dollarsign11.isHidden = false
            dollarsign12.isHidden = true
            dollarsign13.isHidden = true
            dollarsign14.isHidden = false
            dollarsign21.isHidden = true
            dollarsign22.isHidden = false
            dollarsign23.isHidden = false
            dollarsign24.isHidden = true
        }
        
        // if bill is nil, change it to zero
        let bill = Double(billField.text!) ?? 0
        let customTip = Double(customTipField.text!) ?? 0
        
        var tipPercentages = [0.18, 0.20, 0.25, customTip]
        
        // calculate tip and total
        if (tipControl.selectedSegmentIndex == 3) {
            customTipField.becomeFirstResponder()
            customTipField.isHidden = false
            tipPercentages[3] = customTip / 100.0
        } else {
            billField.becomeFirstResponder()
            customTipField.isHidden = true
            customTipField.text = ""
        }
        let total = bill * (tipPercentages[tipControl.selectedSegmentIndex] + 1)
        totalLabel1.text = String(format: "$%.2f", total)
        totalLabel2.text = String(format: "$%.2f", total / 2)
        totalLabel3.text = String(format: "$%.2f", total / 3)
        totalLabel4.text = String(format: "$%.2f", total / 4)
    }
    
    
}

