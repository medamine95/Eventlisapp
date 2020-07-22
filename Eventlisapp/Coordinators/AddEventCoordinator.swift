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
    private var modalNavigationController:UINavigationController?
    private var completion:(UIImage) -> Void = {_ in }
    var parentCoordinator:EventListCoordinator?

    init(navigationController:UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        ///navigation will be played in the modal
        self.modalNavigationController = UINavigationController()
        let addEventViewController:AddEventViewController = .instantiate()
        modalNavigationController?.setViewControllers([addEventViewController], animated: false)
        let addEventViewModel = AddEventViewModel(cellBuilder: EventsCellBuilder(), coreDataManager: CoreDataManager())
        addEventViewModel.coordinator = self
        addEventViewController.viewModel = addEventViewModel
        if let modalNavigationController = modalNavigationController {
            navigationController.present(modalNavigationController, animated: true, completion: nil)
    }
      //  addEventViewController.view.backgroundColor = .orange
    }
    func didFinsihAddEvent(){
        parentCoordinator?.childDidFinsih(self)
    }
    
    func didFinishSaveEvent(){
        navigationController.dismiss(animated: true, completion: nil)
     //   parentCoordinator?.childDidFinsih(self)
  }
    
    func showImagePicker(completion: @escaping(UIImage) -> Void){
        guard let modalNavigationController = modalNavigationController else{
            return
        }
        self.completion = completion
        let imagePickerCoordinator = ImagePickerCoordinator(navigationController: modalNavigationController)
        /// very Important pointing  to parent coordinator to launch actions
        imagePickerCoordinator.parentCoordinator = self
        childCoordinators.append(imagePickerCoordinator)
        imagePickerCoordinator.start()
        print("show image picker")
    }
    
    func didFinishPicking(_ image:UIImage){
        completion(image)
        modalNavigationController?.dismiss(animated: true, completion: nil)
    }
     func childDidFinsih(_ childCoordinator:Coordinator){
        
        print(CoreDataManager().fetchEvents())
         if let index = childCoordinators.firstIndex(where: { coordinator -> Bool in
             return childCoordinator === coordinator
        }){
             childCoordinators.remove(at: index)
         }
    }
    
    deinit {
        print("deinit from addevent coordinator")
    }
}
