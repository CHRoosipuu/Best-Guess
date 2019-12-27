//
//  TakeAGuessViewController.swift
//  Best Guess
//
//  Created by Carl Henry Roosipuu on 12/20/19.
//  Copyright © 2019 CHRoosipuu. All rights reserved.
//

import UIKit

class TakeAGuessViewController: UIViewController {
    
    // List to store guesses
    var guessList: [Guess] = []
    
    // IBOutlets
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var guessTextField: CurrencyTextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Disable Done button
        doneButton.isEnabled = false
        
        // Create next button for keyboard
        let nextButton: UIButton = UIButton(type: UIButton.ButtonType.system)
        nextButton.setTitle("Next", for: .normal)
        nextButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 28)
        nextButton.autoresizesSubviews = true
        nextButton.autoresizingMask = [.flexibleWidth , .flexibleHeight]
        nextButton.addTarget(self, action: #selector(moveToGuess), for: .touchUpInside)
        
        // Create toolbar for keyboard and next button
        let nameTextFieldToolBar = UIToolbar()
        nameTextFieldToolBar.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 75)
        nameTextFieldToolBar.tintColor = UIColor.white
        nameTextFieldToolBar.barTintColor = UIColor(red: 0, green: 0.839, blue: 0.678, alpha: 1)
        nameTextFieldToolBar.setItems([UIBarButtonItem.init(customView: nextButton)], animated: false)
        nameTextField.inputAccessoryView = nameTextFieldToolBar
        
        // Create Save Guess button for keyboard
        let saveGuessButton: UIButton = UIButton(type: UIButton.ButtonType.system)
        saveGuessButton.setTitle("Save Guess", for: .normal)
        saveGuessButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 28)
        saveGuessButton.autoresizesSubviews = true
        saveGuessButton.autoresizingMask = [.flexibleWidth , .flexibleHeight]
        saveGuessButton.addTarget(self, action: #selector(saveGuess), for: .touchUpInside)
        
        // Create toolbar for keyboard and save guess button
        let guessTextFieldToolBar = UIToolbar()
        guessTextFieldToolBar.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 75)
        guessTextFieldToolBar.tintColor = UIColor.white
        guessTextFieldToolBar.barTintColor = UIColor(red: 0, green: 0.839, blue: 0.678, alpha: 1)
        guessTextFieldToolBar.setItems([UIBarButtonItem.init(customView: saveGuessButton)], animated: false)
        guessTextField.inputAccessoryView = guessTextFieldToolBar
        
        // Name text field
        nameTextField.becomeFirstResponder()
        nameTextField.delegate = self
        nameTextField.attributedPlaceholder = NSAttributedString(string: "Enter Name",
                                                                 attributes: [NSAttributedString.Key.foregroundColor:
                                                                    UIColor(red: 0.5725, green: 0.6039, blue: 0.6824, alpha: 1)])
    }

    // Save guess to guessList and reset the text fields for next guess
    @objc func moveToGuess() {
        guessTextField.becomeFirstResponder()
    }
    
    // Save guess to guessList and reset the text fields for next guess
    @objc func saveGuess() {
        guessList.append(Guess(name: nameTextField.text ?? "Anonymous", ammount: Float(guessTextField.value)))
        doneButton.isEnabled = true
        resetGuess()
    }
    
    // Reset text fields
    func resetGuess() {
        nameTextField.text = ""
        guessTextField.value = 0
        nameTextField.becomeFirstResponder()
    }
    

    // MARK: - Navigation
    
    // Prepare for segue, send guessList to answer view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is AnswerViewController {
            let vc = segue.destination as? AnswerViewController
            vc?.guessList = guessList
        }
    }

}

// Go to amountTextField when return from name
extension TakeAGuessViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guessTextField.becomeFirstResponder()
        return false
    }
}
