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
    
    static  func instantiate()-> EventListViewController{
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let controller = storyboard.instantiateViewController(identifier: "EventListViewController") as! EventListViewController
        return controller
    }
    //MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        coreDataManager.saveEvent(name: "test", date: Date(), image: #imageLiteral(resourceName: "test"))
        print(coreDataManager.fetchEvents())
    }
    
    //MARK: - Functions
        
    func setupUI()  {
        let plusimage = UIImage(systemName: "plus.circle.fill")
        let barButtonItem = UIBarButtonItem(image: plusimage, style: .plain, target: self, action: #selector(tappedRightBarButton))
        barButtonItem.tintColor = .primary
        navigationItem.rightBarButtonItem = barButtonItem
        navigationItem.title = "Events"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    @objc private func tappedRightBarButton(){
        print("tapped")
    }
    

 

}
