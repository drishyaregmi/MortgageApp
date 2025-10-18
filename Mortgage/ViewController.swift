//
//  ViewController.swift
//  Mortgage
//
//  Created by Regmi, Drishya on 6/11/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currentPrice: UITextField!
    @IBOutlet weak var taxRate: UITextField!
    @IBOutlet weak var changeInerest: UISlider!
    @IBOutlet weak var changeYears: UIStepper!
    @IBOutlet weak var interest: UILabel!
    @IBOutlet weak var years: UILabel!
    
    @IBOutlet weak var theImage: UIImageView!
    
    @IBOutlet weak var payment: UILabel!
    var mortgageCalc : MortgageCalc!    //want to be initialized wihtout pulling an intitializer
    
    @IBAction func modifyInterest(_ sender: UISlider) {
        let intRrate = changeInerest.value
        interest.text = String(format: "%.2f", intRrate) + "%"
    }
    
    @IBAction func modifyYears(_ sender: UIStepper) {
        years.text = "\(Int(changeYears.value))"
    }
    
    @IBAction func calculateMortgage(_ sender: UIButton) {
        payment.isHidden = false
        if let currentValue = Double(currentPrice.text!){
            if let tax = Double(taxRate.text!){
                let intRate = Double(changeInerest.value)
                let nyears = Int(changeYears.value)
                //below 3 lines have no model; has nothing that relates to the UI; non mvc application
//                intRate /= 1200
//                let theTax = (tax / 1200) * currentValue
//                let pmt = currentValue * (intRate + intRate / pow(1.0 + intRate,Double(nyears) * 12)) + theTax
                mortgageCalc = MortgageCalc(nyears: nyears, currentValue: currentValue, taxRate: tax, intRate: intRate)
                let pmt = mortgageCalc.calculatePayment()
                
                payment.text = String(format: "The Payment is $%.2f.", pmt)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        payment.isHidden = true
        changeYears.value = 15
        changeInerest.value = 5
        // Do any additional setup after loading the view.
        theImage.image = UIImage(named: "trees.png")
        
    }


}

