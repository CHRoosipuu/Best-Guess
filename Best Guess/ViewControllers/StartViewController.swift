//
//  ViewController.swift
//  Best Guess
//
//  Created by Carl Henry Roosipuu on 12/20/19.
//  Copyright © 2019 CHRoosipuu. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    
    @IBAction func unwindToStartView(segue:UIStoryboardSegue) { }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        startButton.layer.cornerRadius = 20
    }


}

