//
//  AddEventViewController.swift
//  Eventlisapp
//
//  Created by MacBook Pro on 7/17/20.
//  Copyright © 2020 Mint. All rights reserved.
//

import UIKit

class AddEventViewController: UIViewController {
    
    var viewModel:AddEventViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel.viewDidDisappear()
    }
    
    deinit {
        print("deinit from addeventviewcontroller")
    }
    

    // MARK: - Navigation


}
