//
//  BCoordinator.swift
//  CoordinatorPattern
//
//  Created by Abanoub Emil on 18/02/2022.
//

import UIKit

class BCoordinator: Coordinator, NavigateToC {
    weak var parentCoordinator: MainCoordinator?
    var children = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = BViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func goToC() {
        let coordinator = CCoordinator(navigationController: navigationController)
        children.append(coordinator)
        coordinator.parentCoordinator = self
        coordinator.start()
        
    }
}
