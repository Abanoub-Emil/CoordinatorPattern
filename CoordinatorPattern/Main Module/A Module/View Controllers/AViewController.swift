//
//  AViewController.swift
//  CoordinatorPattern
//
//  Created by Abanoub Emil on 18/02/2022.
//

import UIKit

class AViewController: UIViewController {
    var coordinator: (NavigateToB & NavigateToC)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func goToB(_ sender: Any) {
        coordinator?.goToB()
    }
    
    @IBAction func goToC(_ sender: Any) {
        coordinator?.goToC()
    }
    
}

