//
//  viewControllerExtension.swift
//  ekoProject
//
//  Created by Lokesh on 21/01/20.
//  Copyright © 2020 Lokesh. All rights reserved.
//

import UIKit
import Foundation

extension UIViewController{
    func showAlert(message: String)
    {
        let actionSheetController: UIAlertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        
        let cancelAction: UIAlertAction = UIAlertAction(title: "OK", style: .cancel) { action -> Void in
            
        }
        actionSheetController.addAction(cancelAction)
        self.present(actionSheetController, animated: true, completion: nil)
    }
}
