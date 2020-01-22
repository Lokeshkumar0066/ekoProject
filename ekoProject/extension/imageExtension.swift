//
//  imageExtension.swift
//  ekoProject
//
//  Created by Lokesh on 21/01/20.
//  Copyright © 2020 Lokesh. All rights reserved.
//

import UIKit
import Foundation

extension UIImageView{
    func cornerRadiusForImage() {
        self.layer.cornerRadius = 4.0
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor .lightGray.cgColor
        self.layer.borderWidth = 0.5
    }
}
