//
//  AppCoordinator.swift
//  Eventlisapp
//
//  Created by MacBook Pro on 6/17/20.
//  Copyright © 2020 Mint. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator: class {
    var childCoordinators:[Coordinator] {get}
    func start()
    
}

final class Appcoordinator:Coordinator{
   private(set) var childCoordinators: [Coordinator] = []
    
    private let window:UIWindow
    
    init(window:UIWindow) {
        
        self.window = window
    }
    
    func start() {
        let  navigationController = UINavigationController()
        let eventListCoordinator = EventListCoordinator(navigationController: navigationController)
        childCoordinators.append(eventListCoordinator)
        eventListCoordinator.start()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
    }
    
    
    
}
