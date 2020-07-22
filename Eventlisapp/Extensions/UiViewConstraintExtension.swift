//
//  UiViewConstraintExtension.swift
//  Eventlisapp
//
//  Created by MacBook Pro on 7/22/20.
//  Copyright © 2020 Mint. All rights reserved.
//

import Foundation
import UIKit

/// pin subviews to superviews

enum Edge {
    case left
    case top
    case right
    case bottom
}

extension UIView {
    
    func  pinToSuperviewEdges(_ edges:[Edge] = [.top,.left,.right,.bottom], constant:CGFloat = 0 ){
        guard let superview = superview else {
            return
        }
        edges.forEach{
            switch $0{
            case .top:
                topAnchor.constraint(equalTo: superview.topAnchor,constant: constant).isActive = true
            case .left:
                leftAnchor.constraint(equalTo: superview.leftAnchor,constant: constant).isActive = true
            case .right:
                rightAnchor.constraint(equalTo: superview.rightAnchor,constant: -constant).isActive = true
             case .bottom:
                bottomAnchor.constraint(equalTo: superview.bottomAnchor,constant: -constant).isActive = true
            }
                        
            
        }
        
        
    }
}
