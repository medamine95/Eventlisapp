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
    let childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController
    private let eventID:NSManagedObjectID
    var parentCoordinator:EventListCoordinator?
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
        detailViewController.viewModel = eventDetailViewModel
        navigationController.pushViewController(detailViewController, animated: true)
        
        
    }
    func didFinsih() {
        parentCoordinator?.childDidFinsih(self)
    }
  
}
