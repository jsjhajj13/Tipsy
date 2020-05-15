//
//  CalculatorViewController.swift
//  Tipsy
//
//  Created by Jagdev Singh Jhajj on 2020-05-14.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    var multiplier: Float = 1.0
    var splitAmount: Float = 0.0
    var splitValue: Float = 0.0
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var zeroPctButton: UIButton!
    
    @IBOutlet weak var twentyPctButton: UIButton!
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        if sender.currentTitle == "10%"{
            multiplier = 1.1
            print("\(0.1)")
        }
        else if sender.currentTitle == "20%"{
            multiplier = 1.2
            print("\(0.2)")
        }
        else {
            multiplier = 1.0
            print("\(0.0)")
        }
        
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
        splitValue = Float(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: Any) {
        if let money = billTextField.text{
            splitAmount = ((Float(money)! * multiplier)) / splitValue
        }
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.tip = Int(multiplier * 100) - 100
            destinationVC.total = splitAmount
            destinationVC.split = Int(splitValue)
            
        }
    }
}
