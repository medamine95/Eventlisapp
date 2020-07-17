//
//  AddEventViewModel.swift
//  Eventlisapp
//
//  Created by MacBook Pro on 7/17/20.
//  Copyright © 2020 Mint. All rights reserved.
//

import Foundation
import UIKit

final class AddEventViewModel{
    
    var onUpdate :() -> Void =  {}
    
    ///embded enum
    
    enum Cell {
        case titleSubtitle(TitleSubtitleCellViewModel)
        case titleImage
    }
    private(set) var cells: [AddEventViewModel.Cell] = []
    var coordinator:AddEventCoordinator?

    func viewDidload(){
        cells = [
            .titleSubtitle(TitleSubtitleCellViewModel(title: "Name", subtitle: "", placeholder: "Add a name")),
            .titleSubtitle(TitleSubtitleCellViewModel(title: "Date", subtitle: "" , placeholder: "select a date"))]
        
        onUpdate()
        
    }
    
    func viewDidDisappear()  {
        coordinator?.didFinsihAddEvent()
    }
    
    func numberOfRows() -> Int{
        return cells.count
    }
    func cell(for indexPath:IndexPath) -> Cell  {
        return cells[indexPath.row]
    }
    
    deinit {
        print("deinit from addeventviewmodel")
    }
}

/// setup views and cells progrmaticlly



