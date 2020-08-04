//
//  EditEventViewController.swift
//  Eventlisapp
//
//  Created by MacBook Pro on 8/4/20.
//  Copyright © 2020 Mint. All rights reserved.
//

import UIKit

class EditEventViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    var viewModel:EditEventViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.onUpdate = { [weak self] in
            self?.tableView.reloadData()
        }
        viewModel.viewDidload()
        setupUI()
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel.viewDidDisappear()
    }
    
    @objc func tappedDone(){
        viewModel.tappedDone()
    }
    
    private func setupUI(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TitleSubtitleCell.self, forCellReuseIdentifier:"TitleSubtitleCell")
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        navigationItem.title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(tappedDone))
        navigationController?.navigationBar.tintColor = .black
        /// forcing large titles
        tableView.setContentOffset(.init(x: 0, y: -1), animated: false)
        
    }
    
    /// use below functions if you don t use storyboard
    
    //    private func setupHierarchy(){
    //
    //    }
    //    private func setupLayout(){
    //
    //    }
    
    
    deinit {
        print("deinit from addeventviewcontroller")
    }
    // MARK: - Navigation
    
}

extension EditEventViewController:UITableViewDataSource {
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
            cell.subtitleTextField.delegate = self
            return cell
        }
    }
}

extension EditEventViewController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectRow(at: indexPath)
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
}

extension EditEventViewController:UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        ///guarding
        guard let currentText = textField.text else {return false}
        let text = currentText + string
        let point = textField.convert(textField.bounds.origin, to: tableView)
        ///unwrapping
        if let indexPath = tableView.indexPathForRow(at: point){
            viewModel.updateCell(indexPath:indexPath,subtitle:text)
        }
        return true
    }
}






