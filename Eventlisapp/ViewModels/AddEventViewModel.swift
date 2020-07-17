//
//  AddEventViewModel.swift
//  Eventlisapp
//
//  Created by MacBook Pro on 7/17/20.
//  Copyright © 2020 Mint. All rights reserved.
//

import Foundation

final class AddEventViewModel{
    var coordinator:AddEventCoordinator?

    func viewDidDisappear()  {
        coordinator?.didFinsihAddEvent()
    }
    
    deinit {
        print("deinit from addeventviewmodel")
    }


}


