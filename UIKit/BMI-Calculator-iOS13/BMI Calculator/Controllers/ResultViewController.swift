//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Sezer İltekin on 21.12.2022.
//

import UIKit

class ResultViewController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultDescriptionLabel: UILabel!
    
    // MARK: - Variables
    
    var result: Float?
    var resultDescription: String?
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let result {
            resultLabel.text = String(format: "%.1f", result)
        }
        
        if let resultDescription {
            resultDescriptionLabel.text = resultDescription
        }
        
    }
    
    // MARK: - IBActions
    
    @IBAction func recalculateTapped(_ sender: Any) {
        self.dismiss(animated: true)
    }
    

}
