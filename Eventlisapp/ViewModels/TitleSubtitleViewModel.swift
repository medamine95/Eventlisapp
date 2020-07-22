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
    enum CellType{
        case text
        case date
        case image
    }
    
    let title:String
    private(set) var subtitle:String
    let placeholder:String
    let type:CellType
    ///closure
    lazy var dateFormatter:DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyy"
        return dateFormatter
    }()
    
    private(set) var image:UIImage?
   /// callback
    
    private(set) var onCellUpdate: (() -> Void)?
    
    init(title:String,subtitle:String,placeholder:String,type:CellType,onCellUpdate: (() -> Void)?) {
        self.title = title
        self.subtitle = subtitle
        self.placeholder = placeholder
        self.type = type
        self.onCellUpdate = onCellUpdate
    }
    
    ///Overloading Concept below
    
    func update(_ subtitle:String){
        self.subtitle = subtitle
    }
    
    func update(_ date:Date){
        let dateString = dateFormatter.string(from: date)
        self.subtitle = dateString
        onCellUpdate?()
        //reload cell
    }
    func update(_ image:UIImage){
       self.image = image
        onCellUpdate?()
    }
}
