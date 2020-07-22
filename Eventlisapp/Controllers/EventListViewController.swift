//
//  EventListViewController.swift
//  Eventlisapp
//
//  Created by MacBook Pro on 7/17/20.
//  Copyright © 2020 Mint. All rights reserved.
//

import UIKit
import CoreData

class EventListViewController: UIViewController {
    
    private let coreDataManager = CoreDataManager()
    
    var viewModel:EventListViewModel!
    
    @IBOutlet var tableView: UITableView!
    
    //MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        /// weak self to avoid retain cycle
        viewModel.onUpdate = {[weak self] in
            self?.tableView.reloadData()
        }
        viewModel.viewDidLoad()
     //   coreDataManager.saveEvent(name: "test", date: Date(), image: #imageLiteral(resourceName: "test"))
   //     print(coreDataManager.fetchEvents())
    }
    
    //MARK: - Functions
        
    func setupUI()  {
        let plusimage = UIImage(systemName: "plus.circle.fill")
        let barButtonItem = UIBarButtonItem(image: plusimage, style: .plain, target: self, action: #selector(tappedAddEventButton))
        barButtonItem.tintColor = .primary
        navigationItem.rightBarButtonItem = barButtonItem
        navigationItem.title = "Events"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.dataSource = self
        tableView.register(EventCell.self, forCellReuseIdentifier: "EventCell")
    }
    
    @objc private func tappedAddEventButton(){
        viewModel.tappedAddEvent()
    }
   
}

extension EventListViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch viewModel.cell(at: indexPath) {
        case .event(let eventCellViewModel):
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath) as! EventCell
            cell.update(with: eventCellViewModel)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
}
