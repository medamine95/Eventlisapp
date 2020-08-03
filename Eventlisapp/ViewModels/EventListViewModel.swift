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
    
    // coredate initalition to inject it later
    private let coreDataManager:CoreDataManager

    init(coreDataManager:CoreDataManager = CoreDataManager.shared){
        self.coreDataManager = coreDataManager
    }
    
    func viewDidLoad(){
        reload()
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
    
    func reload(){
        let events = coreDataManager.fetchEvents()
         cells = events.map {
         var eventCellViewModel = EventCellViewModel($0)
            if let coordinator = coordinator {
                eventCellViewModel.onSelect = coordinator.onSelect
            }
            return .event(eventCellViewModel)
        }
         onUpdate()
    }
    
    func didSelectRow(at indexPath:IndexPath){
        
        switch cells[indexPath.row]{
        case .event(let eventCellViewModel):
            eventCellViewModel.didSelect()
        }
        
    }
    
}
