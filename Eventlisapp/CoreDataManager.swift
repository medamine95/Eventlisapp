//
//  CoreDataManager.swift
//  Eventlisapp
//
//  Created by MacBook Pro on 7/17/20.
//  Copyright © 2020 Mint. All rights reserved.
//

import Foundation
import CoreData
import UIKit

final class CoreDataManager {
    
    //Data presestince
    
    static let shared = CoreDataManager()
    
    lazy var presistentContainer: NSPersistentContainer = {
        let persistentContainer = NSPersistentContainer(name: "EventsApp")
        persistentContainer.loadPersistentStores{
            _, error in
            print(error?.localizedDescription ?? "")
        }
        return persistentContainer
    }()
    
    var moc:NSManagedObjectContext{
        presistentContainer.viewContext
    }
    
    func saveEvent(name:String,date:Date,image:UIImage){
        let event = Event(context: moc)
        event.setValue(name, forKey: "name")
        let imageData = image.jpegData(compressionQuality: 1)
        event.setValue(imageData, forKey: "image")
        event.setValue(date, forKey: "date")
        
        do{
            try moc.save()
        } catch{
            print(error)
        }
    }
    
    func fetchEvents() -> [Event] {
        do{
            let fetchRequest = NSFetchRequest<Event>(entityName: "Event")
            let events = try moc.fetch(fetchRequest)
            return events
        }
        catch{
            print(error)
            return[]
        }
    }
}
