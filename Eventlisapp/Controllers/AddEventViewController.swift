//
//  AddEventViewController.swift
//  Eventlisapp
//
//  Created by MacBook Pro on 7/17/20.
//  Copyright © 2020 Mint. All rights reserved.
//

import UIKit

class AddEventViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    var viewModel:AddEventViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.register(TitleSubtitleCell.self, forCellReuseIdentifier:"TitleSubtitleCell")
        tableView.separatorStyle = .none
        viewModel.onUpdate = { [weak self] in
            self?.tableView.reloadData()
        }
        viewModel.viewDidload()
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

extension AddEventViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellViewModel = viewModel.cell(for: indexPath)
        switch cellViewModel {
        case .titleSubtitle(let titleSubtitleCellViewModel):
            let cell = tableView.dequeueReusableCell(withIdentifier:"TitleSubtitleCell" , for: indexPath ) as!
            TitleSubtitleCell
            cell.update(with: titleSubtitleCellViewModel )
            return cell
        case .titleImage:
            return UITableViewCell()
        }
    }
    
    
}
