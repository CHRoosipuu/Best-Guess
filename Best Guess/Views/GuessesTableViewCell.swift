//
//  GuessesTableViewCell.swift
//  Best Guess
//
//  Created by Carl Henry Roosipuu on 12/25/19.
//  Copyright © 2019 CHRoosipuu. All rights reserved.
//

import UIKit

class GuessesTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
