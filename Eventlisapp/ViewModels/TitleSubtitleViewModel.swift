//
//  TitleSubtitleViewModel.swift
//  Eventlisapp
//
//  Created by MacBook Pro on 7/17/20.
//  Copyright © 2020 Mint. All rights reserved.
//

import Foundation
import UIKit

final class TitleSubtitleCellViewModel{
    let title:String
    private(set) var subtitle:String
    let placeholder:String
    
    init(title:String,subtitle:String,placeholder:String) {
        self.title = title
        self.subtitle = subtitle
        self.placeholder = placeholder
    }
}
