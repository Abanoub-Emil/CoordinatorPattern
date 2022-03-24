//
//  CoordinatorProtocol.swift
//  CoordinatorPattern
//
//  Created by Abanoub Emil on 18/02/2022.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var children: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
