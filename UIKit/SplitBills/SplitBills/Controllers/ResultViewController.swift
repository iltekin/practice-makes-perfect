//
//  ResultViewController.swift
//  SplitBills
//
//  Created by Sezer İltekin on 3.01.2023.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var totalPerPersonLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    
    var totalPerPerson: Float?
    var summary:        String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let totalPerPerson, let summary {
            totalPerPersonLabel.text    = String(totalPerPerson)
            summaryLabel.text           = summary
        }
    }

    @IBAction func recalculateTapped(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
