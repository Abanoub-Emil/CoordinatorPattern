//
//  MainCoordinator.swift
//  CoordinatorPattern
//
//  Created by Abanoub Emil on 18/02/2022.
//

import Foundation
import UIKit

class MainCoordinator: NSObject, Coordinator {
    var children = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = AViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in children.enumerated() {
            if coordinator === child {
                children.remove(at: index)
                break
            }
        }
    }
}

// MARK: Navigation Protocols

extension MainCoordinator: NavigateToB, NavigateToC {
    func goToB() {
        let child = BCoordinator(navigationController: self.navigationController)
        child.parentCoordinator = self
        children.append(child)
        child.start()
    }
    
    func goToC() {
        let child = CCoordinator(navigationController: self.navigationController)
        child.parentCoordinator = self
        children.append(child)
        child.start()
    }
}

// MARK: UINavigationControllerDelegate

extension MainCoordinator: UINavigationControllerDelegate {
  
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        
        guard let fromVc = navigationController.transitionCoordinator?.viewController(forKey: .from) else { return }
        
        if navigationController.viewControllers.contains(fromVc) {
            return
        }
        
        if let bViewController = fromVc as? BViewController {
            childDidFinish(bViewController.coordinator as? BCoordinator)
        }
        if let cViewController = fromVc as? CViewController {
            childDidFinish(cViewController.coordinator)
        }
        
    }
}

protocol NavigateToB {
    func goToB()
}

protocol NavigateToC {
    func goToC()
}
