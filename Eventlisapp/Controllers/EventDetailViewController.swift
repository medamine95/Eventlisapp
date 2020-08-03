//
//  EventDetailViewController.swift
//  Eventlisapp
//
//  Created by MacBook Pro on 8/3/20.
//  Copyright © 2020 Mint. All rights reserved.
//

import UIKit

class EventDetailViewController: UIViewController {
    
    @IBOutlet var backgroundImageView: UIImageView!
    
    @IBOutlet var timeRemainingStackView: TimeRemainingStackView!{
        didSet{
            timeRemainingStackView.setup()
        }
    }
    var viewModel:EventDetailViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.onUpdate = {
            [weak self] in
            // parent viewmodel ?
            guard let self = self, let timeRemainingViewModel = self.viewModel.timeRemainingViewModel else {return}
            self.backgroundImageView.image = self.viewModel.image
            self.timeRemainingStackView.update(with: timeRemainingViewModel)
            //time remaining labels , event name and date label
        }
        viewModel.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.viewDidDisappear()
    }
    
}
