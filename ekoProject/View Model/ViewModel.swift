//
//  ViewModel.swift
//  ekoProject
//
//  Created by Lokesh on 21/01/20.
//  Copyright © 2020 Lokesh. All rights reserved.
//

import UIKit
import Foundation

public typealias ImageDownloadCompletionClosure = (_ imageData: NSData ) -> Void

class UsersViewModel {
    
    private let usersDataModel: UsersDataModel
    
    init(usersDataModel: UsersDataModel)
    {
        self.usersDataModel = usersDataModel
    }

    
    public var userDetails: UsersDataModel {
        return self.usersDataModel
    }
    
    public var loginName: String {
        guard usersDataModel.login.count != 0 else {
            return "--"
        }
        return usersDataModel.login.capitalizingFirstLetter()
    }
    
//    public var gitHub_URL: String {
//        guard usersDataModel.html_url.count != 0 else {
//            return "--"
//        }
//        return usersDataModel.html_url
//    }

    public var accountType: String {
        guard usersDataModel.type.count != 0 else {
            return "Account Type: --"
        }
        return "Account Type: " + usersDataModel.type
    }
    
//    public var siteAdmin: String {
//        if usersDataModel.site_admin == true{
//            return "Site Admin: YES"
//        }else{
//            return "Site Admin: NO"
//        }
//    }
}
