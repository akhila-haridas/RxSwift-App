//
//  NetworkReachability.swift
//  Chefling
//
//  Created by Akhila Haridas on 16/03/19.
//  Copyright © 2019 Akhila Haridas. All rights reserved.
//

import UIKit
import Alamofire

class NetworkReachability {
    class var isReachable: Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
