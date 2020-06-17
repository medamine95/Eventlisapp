//
//  EventListCoordinator.swift
//  Eventlisapp
//
//  Created by MacBook Pro on 6/17/20.
//  Copyright © 2020 Mint. All rights reserved.
//

import Foundation
import UIKit

final class EventListCoordinator:Coordinator{
    
    private(set) var childCoordinators: [Coordinator] = []
    private let navigationController:UINavigationController
    init(navigationController:UINavigationController) {
        self.navigationController = navigationController
    }
    func start() {
        <#code#>
    }
    
    
    
}
