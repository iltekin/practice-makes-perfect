//
//  ColorsDetailVC.swift
//  colorsApp
//
//  Created by Sezer İltekin on 17.10.2022.
//

import UIKit

class ColorsDetailVC: UIViewController {

    var color: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = color ?? .systemBackground
    }

}
