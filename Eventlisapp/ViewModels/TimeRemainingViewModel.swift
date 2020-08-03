//
//  TimeRemainingViewModel.swift
//  Eventlisapp
//
//  Created by MacBook Pro on 8/3/20.
//  Copyright © 2020 Mint. All rights reserved.
//

import Foundation
import UIKit

final class TimeRemainingViewModel {
    
    enum Mode{
        case cell
        case detail
    }
     let timeRemainingParts: [String]
    private let mode:Mode
    
    var fontSize:CGFloat {
        switch mode {
        case .cell:
            return 25
        case .detail:
            return 60
        }
    }
    
    var alignment:UIStackView.Alignment{
        switch mode {
        case .cell:
            return .trailing
        case .detail:
            return .center
        }
    }
    init(timeRemainingParts:[String], mode:Mode) {
        self.timeRemainingParts = timeRemainingParts
        self.mode = mode
    }
    
    
}
