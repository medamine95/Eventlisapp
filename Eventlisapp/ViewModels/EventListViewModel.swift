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
   
    func tappedAddEvent() {
        coordinator?.startAddEvent()
  }
}
