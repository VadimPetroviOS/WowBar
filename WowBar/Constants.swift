//
//  Constants.swift
//  WowBar
//
//  Created by Вадим on 08.06.2023.
//

import Foundation

import UIKit

struct Constants {
    
    static func setSizeX(_ size: CGFloat) -> CGFloat {
        var x: CGFloat = UIScreen.main.bounds.size.width/375
        
        return size * x
    }
    
    static func setSizeY(_ size: CGFloat) -> CGFloat {
        var y: CGFloat = UIScreen.main.bounds.size.height/812
        
        return size * y
    }
    
}
