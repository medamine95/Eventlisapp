//
//  AddEventCoordinator.swift
//  Eventlisapp
//
//  Created by MacBook Pro on 7/17/20.
//  Copyright © 2020 Mint. All rights reserved.
//

import Foundation
import UIKit

final class AddEventCoordinator:Coordinator{
    private(set) var childCoordinators: [Coordinator] = []
    private let navigationController:UINavigationController
    var parentCoordinator:EventListCoordinator?
    init(navigationController:UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let addEventViewController:AddEventViewController = .instantiate()
        let addEventViewModel = AddEventViewModel()
        addEventViewModel.coordinator = self
        addEventViewController.viewModel = addEventViewModel
        navigationController.present(addEventViewController, animated: true, completion: nil)
        addEventViewController.view.backgroundColor = .orange

    }
    func didFinsihAddEvent(){
        parentCoordinator?.childDidFinsih(self)
    }
    
    deinit {
        print("deinit from addevent coordinator")
    }
}
