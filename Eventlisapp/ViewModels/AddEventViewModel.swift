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
    
    
    let title = "Add"
    var onUpdate :() -> Void =  {}
    
    ///embded enum
    
    enum Cell {
        case titleSubtitle(TitleSubtitleCellViewModel)
    }
    private(set) var cells: [AddEventViewModel.Cell] = []
    var coordinator:AddEventCoordinator?
    
    func viewDidload(){
        cells = [
            .titleSubtitle(TitleSubtitleCellViewModel(title: "Name", subtitle: "", placeholder: "Add a name",type:.text, onCellUpdate: {
            })),
            .titleSubtitle(TitleSubtitleCellViewModel(title: "Date", subtitle: "" , placeholder: "select a date",type: .date,onCellUpdate: { [weak self] in
                self?.onUpdate()
            })),
            .titleSubtitle(TitleSubtitleCellViewModel(title: "Background", subtitle: "" , placeholder: "",type: .image,onCellUpdate: { [weak self] in
                self?.onUpdate()
            }))]
        
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
    func tappedDone(){
        //extract info from cell view models and save in core date
        // tell coordinator to dismiss
        print("tapped done")
    }
    
    func updateCell(indexPath:IndexPath,subtitle:String){
        switch cells[indexPath.row] {
        case .titleSubtitle(let titleSubtitleCellViewModel):
            titleSubtitleCellViewModel.update(subtitle)
            break
        }
    }
    
    deinit {
        print("deinit from addeventviewmodel")
    }
}

/// setup views and cells progrmaticlly



