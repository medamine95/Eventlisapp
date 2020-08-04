//
//  EventDetailCoordinator.swift
//  Eventlisapp
//
//  Created by MacBook Pro on 8/3/20.
//  Copyright © 2020 Mint. All rights reserved.
//

import Foundation
import UIKit
import CoreData

final class EventDetailCoordinator:Coordinator{
    private (set) var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController
    private let eventID:NSManagedObjectID
    var parentCoordinator:EventListCoordinator?
    var onUpdateEvent = {}
    // injecting values , such as eventid
    init(eventID:NSManagedObjectID,navigationController:UINavigationController) {
        self.eventID = eventID
        self.navigationController = navigationController
    }
    func start() {
        //Create eventdetailviewcontroller
        //event detail view model
        let detailViewController:EventDetailViewController = .instantiate()
        let eventDetailViewModel = EventDetailViewModel(eventID: eventID)
        eventDetailViewModel.coordinator = self
        onUpdateEvent = {
            eventDetailViewModel.reload()
            self.parentCoordinator?.onUpdateEvent()
        }
        detailViewController.viewModel = eventDetailViewModel
        navigationController.pushViewController(detailViewController, animated: true)
        
        
    }
    func didFinsih() {
        parentCoordinator?.childDidFinsih(self)
    }
    
    func onEditEvent(event:Event) {
        
        let editEventCoordinator = EditEventCoordinator(event: event,navigationController: navigationController)
        editEventCoordinator.parentCoordinator = self
        childCoordinators.append(editEventCoordinator)
        editEventCoordinator.start()
        
    }
   
     func childDidFinsih(_ childCoordinator:Coordinator){
        
        print(CoreDataManager().fetchEvents())
         if let index = childCoordinators.firstIndex(where: { coordinator -> Bool in
             return childCoordinator === coordinator
        }){
             childCoordinators.remove(at: index)
         }
    }
  
}
