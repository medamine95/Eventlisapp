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
    weak var coordinator: AddEventCoordinator?
    
    /// referneces
    
    private var nameCellViewModel:TitleSubtitleCellViewModel?
    private var dateCellViewModel:TitleSubtitleCellViewModel?
    private var backgroundImageCellViewModel:TitleSubtitleCellViewModel?
    private let cellBuilder : EventsCellBuilder
    private let coreDataManager:CoreDataManager
    
    ///Code cleaning and redendcy ceaning , coredata service if needed
    
    
    lazy var dateFormatter:DateFormatter = {
        let dateFormatter = DateFormatter()
              dateFormatter.dateFormat = "dd.MM.yyy"
              return dateFormatter    }()
    
    init(cellBuilder:EventsCellBuilder, coreDataManager:CoreDataManager) {
        self.cellBuilder = cellBuilder
        self.coreDataManager = coreDataManager
    }
    
    func viewDidload(){
        setupCells()
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
        guard let name = nameCellViewModel?.subtitle, let dateString = dateCellViewModel?.subtitle, let image = backgroundImageCellViewModel?.image, let date = dateFormatter.date(from: dateString) else {return}
      
        coreDataManager.saveEvent(name: name, date: date, image: image)
        coordinator?.didFinishSaveEvent()
        print("tapped done")
    }
    
    func updateCell(indexPath:IndexPath,subtitle:String){
        switch cells[indexPath.row] {
        case .titleSubtitle(let titleSubtitleCellViewModel):
            titleSubtitleCellViewModel.update(subtitle)
            break
        }
    }
    
    ///when tapping the image
    
    func didSelectRow(at indexPath:IndexPath){
        switch cells[indexPath.row] {
        case .titleSubtitle(let titleSubtitleCellViewModel):
            guard titleSubtitleCellViewModel.type == .image else{
                return
            }
            coordinator?.showImagePicker{
                image in
                titleSubtitleCellViewModel.update(image)
             //do somthing in this closure
                
            }
       }
    }
    
    deinit {
        print("deinit from addeventviewmodel")
    }
}

/// setup views and cells progrmaticlly


private extension AddEventViewModel {
    
    func setupCells() {
        
        nameCellViewModel = cellBuilder.makeTitleSubtitleCellViewModel(.text)
        
        dateCellViewModel = cellBuilder.makeTitleSubtitleCellViewModel(.date){[weak self] in
            self?.onUpdate()
            
        }
        
        backgroundImageCellViewModel = cellBuilder.makeTitleSubtitleCellViewModel(.image){
            [weak self] in
            self?.onUpdate()
        }
        
        
        ///safe unwrapping
        guard let nameCellViewModel = nameCellViewModel, let dateCellViewModel = dateCellViewModel, let backgroundImageCellViewModel = backgroundImageCellViewModel else {return}
        
        cells = [
            .titleSubtitle(
                nameCellViewModel
            ),
            .titleSubtitle(
                dateCellViewModel),
            .titleSubtitle(
                backgroundImageCellViewModel)]
    }
}
