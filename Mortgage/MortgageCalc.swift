//
//  MortgageCalc.swift
//  Mortgage
//
//  Created by Regmi, Drishya on 6/11/25.
//
//this iss the model
import Foundation
class MortgageCalc {
    var nyears: Int
    var currentValue: Double
    var tax: Double
    var intRate: Double
    
    init(nyears: Int, currentValue: Double, taxRate: Double, intRate: Double) {
        self.nyears = nyears
        self.currentValue = currentValue
        self.tax = taxRate
        self.intRate = intRate
    }
    func calculatePayment() -> Double {
        intRate /= 1200
        let theTax = (tax / 1200) * currentValue
        let pmt = currentValue * (intRate + intRate / pow(1.0 + intRate,Double(nyears) * 12)) + theTax
        return pmt
    }
}
