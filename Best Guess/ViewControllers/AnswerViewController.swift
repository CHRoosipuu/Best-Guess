//
//  AnswerViewController.swift
//  Best Guess
//
//  Created by Carl Henry Roosipuu on 12/20/19.
//  Copyright © 2019 CHRoosipuu. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {
    
    // Variables
    var guessList: [Guess] = []
    
    @IBOutlet weak var answerTextField: CurrencyTextField!
    @IBOutlet weak var avgGuessLabel: UILabel!
    @IBOutlet weak var guessesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        guessesTableView.delegate = self
        guessesTableView.dataSource = self
        
        let guessSum = guessList.reduce(0, {x, y in
            x + y.ammount})
        let avgGuess = guessSum / Float(guessList.count)
        
        avgGuessLabel.text! += Formatter.currency.string(from: NSNumber(value: avgGuess))!

        // Do any additional setup after loading the view.
        
        // answerTextField
        answerTextField.becomeFirstResponder()
        
    }
    

    // MARK: - Navigation
    
    // Prepare for segue, send guessList to answer view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is ResultsViewController {
            let vc = segue.destination as? ResultsViewController
            vc?.guessList = guessList
            vc?.answer = answerTextField.value
        }
    }

}

// Setup guesses tableview
extension AnswerViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return guessList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "guessCellReuseIdentifier", for: indexPath) as! GuessesTableViewCell
        let guess = guessList[indexPath.row]
        cell.nameLabel.text = guess.name
        cell.amountLabel.text = Formatter.currency.string(from: NSNumber(value: guess.ammount))
        return cell
    }
}

