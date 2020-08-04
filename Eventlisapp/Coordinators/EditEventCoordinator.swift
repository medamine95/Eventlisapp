//
//  EditEventCoordinator.swift
//  Eventlisapp
//
//  Created by MacBook Pro on 7/17/20.
//  Copyright © 2020 Mint. All rights reserved.
//

import Foundation
import UIKit

final class EditEventCoordinator:Coordinator{
    private(set) var childCoordinators: [Coordinator] = []
    private let navigationController:UINavigationController
    private var completion:(UIImage) -> Void = {_ in }
    private let event:Event
    var parentCoordinator:EventDetailCoordinator?

    init(event:Event, navigationController:UINavigationController) {
        self.event = event
        self.navigationController = navigationController
    }
    
    func start() {
        ///navigation will be played in the modal
        let editEventViewController:EditEventViewController = .instantiate()
        let editEventViewModel = EditEventViewModel(event: event, cellBuilder: EventsCellBuilder())
        editEventViewModel.coordinator = self
        editEventViewController.viewModel = editEventViewModel
        navigationController.pushViewController(editEventViewController, animated: true)
   
    }
    func didFinsihAddEvent(){
        parentCoordinator?.childDidFinsih(self)
    }
    
    func didFinishUpdateEvent(){
        parentCoordinator?.onUpdateEvent()
        navigationController.popViewController(animated: true)
     //   parentCoordinator?.childDidFinsih(self)
  }
    
    func showImagePicker(completion: @escaping(UIImage) -> Void){
    
        self.completion = completion
        let imagePickerCoordinator = ImagePickerCoordinator(navigationController: navigationController)
        /// very Important pointing  to parent coordinator to launch actions
        imagePickerCoordinator.parentCoordinator = self
        imagePickerCoordinator.onFinsihPicking = { image in
            completion(image)
            self.navigationController.dismiss(animated: true, completion: nil)
        }
        childCoordinators.append(imagePickerCoordinator)
        imagePickerCoordinator.start()
        print("show image picker")
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
