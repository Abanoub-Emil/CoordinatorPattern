//
//  CCoordinator.swift
//  CoordinatorPattern
//
//  Created by Abanoub Emil on 18/02/2022.
//

import UIKit

class CCoordinator: Coordinator {
    weak var parentCoordinator: Coordinator?
    var children = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = CViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }

}
