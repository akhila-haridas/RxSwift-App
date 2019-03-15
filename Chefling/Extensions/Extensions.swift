//
//  Extensions.swift
//  Chefling
//
//  Created by Akhila Haridas on 15/03/19.
//  Copyright © 2019 Akhila Haridas. All rights reserved.
//

import UIKit

extension UIColor {
    
    static func lightGreenColor() -> UIColor {
        return UIColor(red: 23/255, green: 160/255, blue: 41/255, alpha: 255/255)
    }
    static func navBarDefault() -> UIColor {
        return UIColor(red: 0.969, green: 0.969, blue: 0.969, alpha: 1.0)
    }
    static func borderGrey() -> UIColor {
        return UIColor(red: 196.0, green: 196.0, blue: 196, alpha: 1.0)
    }
}

extension UIApplication {
    var statusBarView: UIView? {
        return value(forKey: "statusBar") as? UIView
    }
}
