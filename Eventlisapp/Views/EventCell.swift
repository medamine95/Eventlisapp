//
//  EventCell.swift
//  Eventlisapp
//
//  Created by MacBook Pro on 7/22/20.
//  Copyright © 2020 Mint. All rights reserved.
//


import Foundation
import UIKit

final class EventCell:UITableViewCell{
    
    private let timeRemainingStackView = TimeRemainingStackView()
    private let dateLabel = UILabel()
    
    private let eventNamelabel = UILabel()
    private let backgroumdImageView = UIImageView()
    private let verticalStackView = UIStackView()
    
    private let constant:CGFloat = 15


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupHierarchy()
        setupLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    
    private func setupViews(){
        timeRemainingStackView.setup()
        // to not get weird layout issues
        [dateLabel,eventNamelabel,backgroumdImageView,verticalStackView].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        
        dateLabel.font = .systemFont(ofSize: 22,weight:.medium)
        dateLabel.textColor = .white
        eventNamelabel.font = .systemFont(ofSize: 34, weight:.bold)
        eventNamelabel.textColor = .white
        
          verticalStackView.axis = .vertical
        verticalStackView.alignment = .trailing

    }
    private func setupHierarchy(){
         contentView.addSubview(backgroumdImageView)
        contentView.addSubview(verticalStackView)
        contentView.addSubview(eventNamelabel)
       
        verticalStackView.addArrangedSubview(timeRemainingStackView)
        verticalStackView.addArrangedSubview(UIView())
        verticalStackView.addArrangedSubview(dateLabel)
        }
    
    private func setupLayout(){
        ///using default values
        backgroumdImageView.pinToSuperviewEdges([.left, .top, .right])
        let bottomConstraint = backgroumdImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        bottomConstraint.priority = .required - 1
        bottomConstraint.isActive = true
        
        backgroumdImageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        verticalStackView.pinToSuperviewEdges([.top,.right,.bottom],constant: 15)
        dateLabel.pinToSuperviewEdges([.left],constant: 15)
        eventNamelabel.pinToSuperviewEdges([.left],constant: 15)
        
    }
    
    func update(with viewModel:EventCellViewModel) {
        /// enumarted gives the currentt number of  the element
        /// unrwaapinng stuff
        if let timeRemainingViewModel = viewModel.timeRemainingViewModel{
            timeRemainingStackView.update(with: timeRemainingViewModel)
     }
        dateLabel.text = viewModel.dateText
        eventNamelabel.text = viewModel.eventName
        viewModel.loadImage{ image in
            self.backgroumdImageView.image = image
        }
  }
    
    
}


