//  ViewController.swift
//  Prework
//
//  Created by Zifeng Liang on 2020/12/21.

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billTitle: UILabel!
    @IBOutlet weak var tipTitle: UILabel!
    @IBOutlet weak var totalTitle: UILabel!
    @IBOutlet weak var peopleTitle: UILabel!
    @IBOutlet weak var individualTitle: UILabel!
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var peopleControl: UISlider!
    @IBOutlet weak var individualLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        billField.becomeFirstResponder()
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        // Get initial bill amount and calculate tip
        let bill = Double(billField.text!) ?? 0
        let tipPercentages = [0.15, 0.18, 0.2]
        let numPeople = Double(floor(peopleControl.value))
    
        // Calculate tip, individual, and total
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        let individual = total / numPeople
        
        // Update tip, individual, and total labels
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        individualLabel.text = String(format: "$%.2f", individual)
    }
    
    @IBAction func peopleChanged(_ sender: Any) {
        peopleTitle.text = "People     \(Int(peopleControl.value))"
    }
    
    @IBAction func lightSwitch(_ sender: UISwitch) {
        // light
        if (sender.isOn == true) {
            view.backgroundColor = UIColor.white
            billTitle.textColor = UIColor.black
            peopleTitle.textColor = UIColor.black
            tipTitle.textColor = UIColor.black
            totalTitle.textColor = UIColor.black
            individualTitle.textColor = UIColor.black
            tipLabel.textColor = UIColor.black
            totalLabel.textColor = UIColor.black
            individualLabel.textColor = UIColor.black
            billField.backgroundColor = UIColor.white
            billField.textColor = UIColor.black
            tipControl.tintColor = UIColor.black
            peopleControl.tintColor = UIColor.black
            billField.keyboardAppearance = UIKeyboardAppearance.light;
        // dark
        } else {
            view.backgroundColor = UIColor.black
            billTitle.textColor = UIColor.white
            peopleTitle.textColor = UIColor.white
            tipTitle.textColor = UIColor.white
            totalTitle.textColor = UIColor.white
            individualTitle.textColor = UIColor.white
            tipLabel.textColor = UIColor.white
            totalLabel.textColor = UIColor.white
            individualLabel.textColor = UIColor.white
            billField.backgroundColor = UIColor.black
            billField.textColor = UIColor.white
            tipControl.tintColor = UIColor.white
            peopleControl.tintColor = UIColor.white
            billField.keyboardAppearance = UIKeyboardAppearance.dark;
        }
    }
}
