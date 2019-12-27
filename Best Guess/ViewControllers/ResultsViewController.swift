//
//  ResultsViewController.swift
//  Best Guess
//
//  Created by Carl Henry Roosipuu on 12/20/19.
//  Copyright © 2019 CHRoosipuu. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var guessList: [Guess] = []
    var answer: Float = 0
    
    
    @IBOutlet weak var winnerNameLabel: UILabel!
    @IBOutlet weak var winnerGuessLabel: UILabel!
    @IBOutlet weak var winnerDiffrenceLabel: UILabel!
    
    @IBOutlet weak var resultsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultsTableView.delegate = self
        resultsTableView.dataSource = self
        
        guessList.sort { (this: Guess, other: Guess) -> Bool in
            return abs(this.ammount - answer) < abs(other.ammount - answer)
        }

        winnerNameLabel.text = guessList[0].name
        winnerGuessLabel.text = Formatter.currency.string(from: NSNumber(value: guessList[0].ammount))
        
        let winnerGuessDiffrence = guessList[0].ammount - answer
        
        if (winnerGuessDiffrence < 0) {
            winnerDiffrenceLabel.textColor = UIColor(red: 1, green: 0.2745, blue: 0.2745, alpha: 1)
            winnerDiffrenceLabel.text = String(format: "%.02f", winnerGuessDiffrence)
        } else {
            winnerDiffrenceLabel.textColor = UIColor(red: 0, green: 0.8392, blue: 0.6784, alpha: 1)
            winnerDiffrenceLabel.text = String(format: "+%.02f", winnerGuessDiffrence)
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

// Setup results tableview
extension ResultsViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return guessList.count - 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultsCellReuseIdentifier", for: indexPath) as! ResultsTableViewCell
        let guess = guessList[indexPath.row + 1]
        cell.nameLabel.text = String(indexPath.row + 2) + ".    " + guess.name
        cell.amountLabel.text = Formatter.currency.string(from: NSNumber(value: guess.ammount))
        
        
            
        let guessDiffrence = guess.ammount - answer
        
        if (guessDiffrence < 0) {
            cell.diffrenceLabel.textColor = UIColor(red: 1, green: 0.2745, blue: 0.2745, alpha: 1)
            cell.diffrenceLabel.text = String(format: "%.02f", guessDiffrence)
        } else {
            cell.diffrenceLabel.textColor = UIColor(red: 0, green: 0.8392, blue: 0.6784, alpha: 1)
            cell.diffrenceLabel.text = String(format: "+%.02f", guessDiffrence)
        }

        
        return cell
    }
}
