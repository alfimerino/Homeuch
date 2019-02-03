//
//  ResultsViewController.swift
//  Matadoor
//
//  Created by gnoa001 on 2/2/19.
//  Copyright © 2019 Giovanni Noa. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        guard let val = Double(textField.text!) else { return }
        monthlyIncome = val
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
