//
//  BViewController.swift
//  CoordinatorPattern
//
//  Created by Abanoub Emil on 18/02/2022.
//

import UIKit

class BViewController: UIViewController {
    var coordinator: NavigateToC?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func goToC(_ sender: Any) {
        coordinator?.goToC()
    }
    
}
