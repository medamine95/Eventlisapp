//
//  EventCellViewModel.swift
//  Eventlisapp
//
//  Created by MacBook Pro on 7/22/20.
//  Copyright © 2020 Mint. All rights reserved.
//

import Foundation
import UIKit
 
struct EventCellViewModel {
    let date = Date()
    private static let imageCache = NSCache<NSString,UIImage>()
    private let imageQueue =  DispatchQueue(label: "imageQueue",qos: .background)
    private var cacheKey:String{
        event.objectID.description
    }
    var timeRemainingStrings:[String]{
        // 1 year , 1 month , 2 weeks , 1 day
        guard let eventDate = event.date else {return []}
        return date.timeRemaining(until: eventDate)?.components(separatedBy:",") ?? []
    }
    
    var dateText: String?{
        guard let eventDate = event.date else  {return nil}
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MM yyy"
        return dateFormatter.string(from: eventDate)
    }
    var eventName: String? {
        event.name
    }
//    var backgroundImage: UIImage {
//        guard let imageData = event.image else {return UIImage()}
//        return UIImage(data: imageData) ?? UIImage()
//    }
    /// to speed up image loading 
    
    func loadImage(completion:@escaping(UIImage?) -> Void)  {
        
        if let image = Self.imageCache.object(forKey: cacheKey as NSString) {
            completion(image)
        } else{
            imageQueue.async {
                guard let imageData = self.event.image, let image = UIImage(data: imageData) else {
                    completion(nil)
                    return
                }
                Self.imageCache.setObject(image, forKey:self.cacheKey as NSString)
                DispatchQueue.main.async {
                    completion(image)
                    
                }
            }
        }
    }
    
    private let event:Event
    init(_ event: Event){
        self.event = event
    }
}

