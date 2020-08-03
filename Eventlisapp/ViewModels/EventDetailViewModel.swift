//
//  EventDetailViewModel.swift
//  Eventlisapp
//
//  Created by MacBook Pro on 8/3/20.
//  Copyright © 2020 Mint. All rights reserved.
//

import Foundation
import CoreData
import UIKit

final class EventDetailViewModel{
    
    private let eventID:NSManagedObjectID
    private let coreDataManager:CoreDataManager
    private var event:Event?
    private let date = Date()
    var onUpdate = {}
    var coordinator:EventDetailCoordinator?
    
    var image : UIImage? {
        guard let imageData = event?.image else {return nil}
        return UIImage(data: imageData)
    }
    
    var timeRemainingViewModel:TimeRemainingViewModel?{
        guard let eventDate = event?.date, let timeRemainingParts = date.timeRemaining(until: eventDate)?.components(separatedBy: ",")  else  {return nil}
             return TimeRemainingViewModel(timeRemainingParts: timeRemainingParts, mode: .detail)
    }

    init(eventID: NSManagedObjectID, coreDataManager: CoreDataManager = .shared) {
        self.eventID = eventID
        self.coreDataManager = coreDataManager
    }

    func viewDidLoad(){
        event = coreDataManager.getEvent(eventID)
        onUpdate()
    }
    
    func viewDidDisappear(){
        coordinator?.didFinsih()
    }
}

