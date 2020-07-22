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
    
    var yearText: String {
        "1 Year"
    }
    var monthText: String{
        "2 months"
    }
    var weekText: String{
       "2 weeks"
     }
    var dayText: String{
        "2 days"
    }
    
    var dateText: String{
        "25 Mar 2020"
    }
    var eventName: String {
        "Barbados"
    }
    var backgroundImage: UIImage {
       #imageLiteral(resourceName: "test")
    }
}

