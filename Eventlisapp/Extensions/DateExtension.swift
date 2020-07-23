//
//  DateExtension.swift
//  Eventlisapp
//
//  Created by MacBook Pro on 7/23/20.
//  Copyright © 2020 Mint. All rights reserved.
//

import Foundation

extension Date{
    func timeRemaining(until endDate:Date) -> String? {
        let dateComponentsFormatter = DateComponentsFormatter()
        dateComponentsFormatter.allowedUnits = [.year,.month,.weekOfMonth,.day]
        dateComponentsFormatter.unitsStyle = .full
        return dateComponentsFormatter.string(from: self, to: endDate)
    }
}
