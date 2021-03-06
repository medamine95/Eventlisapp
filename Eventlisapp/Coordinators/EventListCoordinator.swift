//
//  EventListCoordinator.swift
//  Eventlisapp
//
//  Created by MacBook Pro on 6/17/20.
//  Copyright © 2020 Mint. All rights reserved.
//

import Foundation
import UIKit
import CoreData

final class EventListCoordinator:Coordinator{
    
    private(set) var childCoordinators: [Coordinator] = []
    var onUpdateEvent = {}
    private let navigationController:UINavigationController
    init(navigationController:UINavigationController) {
        self.navigationController = navigationController
    }
    func start() {
        let eventListViewController:EventListViewController = .instantiate()
        let eventListViewModel = EventListViewModel()
        eventListViewModel.coordinator = self
        onUpdateEvent = eventListViewModel.reload
        eventListViewController.viewModel = eventListViewModel
        navigationController.setViewControllers( [eventListViewController], animated: false)
    }
    func startAddEvent(){
        let addEventCoordinator = AddEventCoordinator(navigationController:navigationController)
        addEventCoordinator.parentCoordinator = self
        childCoordinators.append(addEventCoordinator)
        addEventCoordinator.start()
    }
    
    func onSelect(_ id:NSManagedObjectID){
        print(id)
        let eventDetailCoordinator = EventDetailCoordinator(eventID: id, navigationController:navigationController)
        /// 9otlou rani bouh
        eventDetailCoordinator.parentCoordinator = self
        childCoordinators.append(eventDetailCoordinator)
        eventDetailCoordinator.start()
        // trigger event detail coordinator
    }
    
    ///anonymus argument
    func childDidFinsih(_ childCoordinator:Coordinator){
        print(CoreDataManager().fetchEvents().first?.name)
        
        if let index = childCoordinators.firstIndex(where: { coordinator -> Bool in
            return childCoordinator === coordinator
       }){
            childCoordinators.remove(at: index)
        }
   }
 
}
