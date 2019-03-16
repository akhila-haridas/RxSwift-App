//
//  Utils.swift
//  Chefling
//
//  Created by Akhila Haridas on 15/03/19.
//  Copyright © 2019 Akhila Haridas. All rights reserved.
//

import UIKit

class Utils {
    static func setViewCornerRadius(view: UIView?) {
        view?.layer.cornerRadius = 6
        view?.layer.masksToBounds = true
    }
    
    static func setViewBorderColor(view: UIView?, color: UIColor?) {
        view?.layer.borderWidth = 1
        view?.layer.borderColor = color?.cgColor
    }
    
    
}
