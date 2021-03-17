//
//  ViewController.swift
//  iospractice
//
//  Created by Yastrebov Vsevolod on 16.03.2021.
//

import UIKit

class ViewController: UIViewController {

    enum InputScale {
        case Celsius
        case Fahrenheit
        case Kelvin
    }
    
    @IBOutlet weak var celsiusField: UITextField!
    @IBOutlet weak var kelvinField: UITextField!
    @IBOutlet weak var fahrenheitField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func celsiusFieldEdited(_ sender: UITextField) {
        let stringValue: String = sender.text ?? "?"
        if stringValue == "" {
            fahrenheitField.text = ""
            kelvinField.text = ""
            return
        }
        let value = Double(stringValue)
        if(value == nil) {
            kelvinField.text = "?"
            fahrenheitField.text = "?"
        } else {
            convertAndAssign(degrees: value ?? 0.0, from: InputScale.Celsius)
        }
    }
    
    @IBAction func kelvinFieldEdited(_ sender: UITextField) {
        let stringValue: String = sender.text ?? "?"
        if stringValue == "" {
            fahrenheitField.text = ""
            celsiusField.text = ""
            return
        }
        let value = Double(stringValue)
        if(value == nil) {
            fahrenheitField.text = "?"
            celsiusField.text = "?"
        } else {
            convertAndAssign(degrees: value ?? 0.0, from: InputScale.Kelvin)
        }
    }
    
    @IBAction func fahrenheitFieldEdited(_ sender: UITextField) {
        let stringValue: String = sender.text ?? "?"
        if stringValue == "" {
            kelvinField.text = ""
            celsiusField.text = ""
            return
        }
        let value = Double(stringValue)
        if(value == nil) {
            kelvinField.text = "?"
            celsiusField.text = "?"
        } else {
            convertAndAssign(degrees: value ?? 0.0, from: InputScale.Fahrenheit)
        }
    }
    
    /// Convert Celsius to Fahrenheit
    func ctof(from c: Double) -> Double {
        c * 9 / 5 + 32
    }
    
    /// Convert Fahrenheit to Celsius
    func ftoc(from f: Double) -> Double {
        (f - 32) * 5 / 9
    }
    
    func convertAndAssign(degrees value: Double, from source: InputScale) {
        var cval, kval, fval: Double
        switch source {
            case InputScale.Celsius:
                cval = value
                kval = cval + 273.15
                fval = ctof(from: cval)
                kelvinField.text = String(format: "%.2f", kval)
                fahrenheitField.text = String(format: "%.2f", fval)
                break
            case InputScale.Kelvin:
                kval = value
                cval = kval - 273.15
                fval = ctof(from: cval)
                celsiusField.text = String(format: "%.2f", cval)
                fahrenheitField.text = String(format: "%.2f", fval)
                break
            case InputScale.Fahrenheit:
                fval = value
                cval = ftoc(from: fval)
                kval = cval + 273.15
                celsiusField.text = String(format: "%.2f", cval)
                kelvinField.text = String(format: "%.2f", kval)
                break
        }
    }
}

