//
//  UIImageExtension.swift
//  Eventlisapp
//
//  Created by MacBook Pro on 8/3/20.
//  Copyright © 2020 Mint. All rights reserved.
//

import Foundation
import UIKit

extension UIImage{
    
    func sameAspectRatio(newHeight:CGFloat) -> UIImage {
        let scale = newHeight / size.height
        let newWidth = size.width * scale
        let newSize = CGSize(width: newWidth, height: newHeight)
        return UIGraphicsImageRenderer(size: newSize).image { _ in
            self.draw(in: .init(origin: .zero, size: newSize))
        }
    }
    
    
}
