//
//  EventListViewModel.swift
//  Eventlisapp
//
//  Created by MacBook Pro on 7/17/20.
//  Copyright © 2020 Mint. All rights reserved.
//

import Foundation
final class EventListViewModel{
    
    let title = "Events"
    /// coordinator reference
    var coordinator:EventListCoordinator?
    ///callback
    var onUpdate = {}
    
    
    enum Cell {
        case event(EventCellViewModel)
    }
    
    private(set) var cells:[Cell] = []
    
    /// coredate initalition to inject it later 
//    private let coreDataManager:CoreDataManager
//
//    init(coreDataManager:CoreDataManager){
//        self.coreDataManager = coreDataManager
//    }
    
    func viewDidLoad(){
        cells = [.event(EventCellViewModel()),.event(EventCellViewModel())]
        onUpdate()
    }
    
    func tappedAddEvent() {
        coordinator?.startAddEvent()
  }
    
    func numberOfRows() -> Int {
        return cells.count
    }
    
    func cell(at indexPath:IndexPath)->Cell{
        return cells[indexPath.row]
    }
    
    
}
