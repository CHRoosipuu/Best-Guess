//
//  CurrencyTextField.swift
//  Best Guess
//
//  Created by Carl Henry Roosipuu on 12/21/19.
//  Copyright © 2019 CHRoosipuu. All rights reserved.
//

import UIKit

class CurrencyTextField: UITextField {

    // Variables
        static let max_digits = 15
        static var locale:Locale!
        
        // value of Text Field
        var value:Float {
            
            get {
                Formatter.currency.locale = Locale.current
                let divider:Double = pow(Double(10), Double(Formatter.currency.maximumFractionDigits))
                
                if let t = text {
                    return Float(t.numbers.integer) / Float(divider)
                } else {
                    return 0.0
                }
            }
            set(newVal) {
                Formatter.currency.locale = Locale.current
                
                text = Formatter.currency.string(from: NSNumber(value: newVal))
            }
        }
        
        override func awakeFromNib() {
            super.awakeFromNib()
            addTarget(self, action: #selector(editingChanged), for: .editingChanged)
            editingChanged()
        }
        
        // Format the textField when edditing changes
        @objc func editingChanged() {
            let max = String(string.prefix(CurrencyTextField.max_digits))
            Formatter.currency.locale = Locale.current
            let divider:Double = pow(Double(10), Double(Formatter.currency.maximumFractionDigits))
            text = Formatter.currency.string(from: (Double(max.numbers.integer) / divider) as NSNumber)
            self.value = (Float(max.numbers.integer) / Float(divider))
        }
    }


    struct Formatter {
        static let currency = NumberFormatter(numberStyle: .currency)
    }


    extension UITextField {
        var string: String { return text ?? "" }
    }


    extension String {
        var numbers: String { return components(separatedBy: Numbers.characterSet.inverted).joined() }
        var integer: Int { return Int(numbers) ?? 0 }
    }


    struct Numbers { static let characterSet = CharacterSet(charactersIn: "0123456789") }


    extension NumberFormatter {
        convenience init(numberStyle: NumberFormatter.Style) {
            self.init()
            self.numberStyle = numberStyle
        }

}
