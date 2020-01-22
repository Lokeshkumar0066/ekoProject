//
//  Connectivity.swift
//  ekoProject
//
//  Created by Lokesh on 21/01/20.
//  Copyright © 2020 Lokesh. All rights reserved.
//

import UIKit
import Alamofire


class Connectivity: NSObject {
    class var isConnectedToInternet:Bool {
        return NetworkReachabilityManager()!.isReachable
    }

}
