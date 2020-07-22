//
//  EventsCellBuilder.swift
//  Eventlisapp
//
//  Created by MacBook Pro on 7/22/20.
//  Copyright © 2020 Mint. All rights reserved.
//

import Foundation

struct EventsCellBuilder {
    
    func makeTitleSubtitleCellViewModel(_ type :TitleSubtitleCellViewModel.CellType,onCellUpdate:(() -> Void)? = nil ) -> TitleSubtitleCellViewModel {
        
        switch type {
        case .text:
            return TitleSubtitleCellViewModel(
                title: "Name",
                subtitle: "",
                placeholder: "Add a name"
                ,type:.text,
                onCellUpdate:onCellUpdate)
        case .date:
            return TitleSubtitleCellViewModel(
                title: "Date",
                subtitle: "" ,
                placeholder: "select a date",
                type: .date,
                onCellUpdate: onCellUpdate)
            
        case .image:
            
            return TitleSubtitleCellViewModel(
            title: "Background",
            subtitle: "" ,
            placeholder: "",type: .image,
            onCellUpdate: onCellUpdate)
            }
    }
}


