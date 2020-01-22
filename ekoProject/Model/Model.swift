//
//  Model.swift
//  ekoProject
//
//  Created by Lokesh on 21/01/20.
//  Copyright © 2020 Lokesh. All rights reserved.
//

import UIKit
import Foundation

// MARK: - Model

struct UsersDataModel {
    
    let login: String
    let id: Int
    let avatar_url: String
    let node_id: String
    let gravatar_id:  String
    let url: String
    let html_url: String
    let followers_url:  String
    let following_url: String
    let gists_url: String
    let starred_url:   String
    let subscriptions_url:  String
    let organizations_url: String
    let repos_url: String
    let events_url:  String
    let received_events_url: String
    let type: String
    let site_admin:  Bool
    let score: Double
    
    init(response:[String:Any]) {
        self.id = response["id"] as? Int ?? 0
        self.login = response["login"] as? String ?? ""
        self.node_id = response["node_id"] as? String ?? ""
        self.avatar_url = response["avatar_url"] as? String ?? ""
        self.gravatar_id = response["gravatar_id"] as? String ?? ""
        self.url = response["url"] as? String ?? ""
        self.html_url = response["html_url"] as? String ?? ""
        self.followers_url = response["followers_url"] as? String ?? ""
        self.following_url = response["following_url"] as? String ?? ""
        self.gists_url = response["gists_url"] as? String ?? ""
        self.starred_url = response["starred_url"] as? String ?? ""
        self.subscriptions_url = response["subscriptions_url"] as? String ?? ""
        self.organizations_url = response["organizations_url"] as? String ?? ""
        self.repos_url = response["repos_url"] as? String ?? ""
        self.events_url = response["events_url"] as? String ?? ""
        self.received_events_url = response["received_events_url"] as? String ?? ""
        self.type = response["type"] as? String ?? ""
        self.site_admin = response["site_admin"] as? Bool ?? false
        self.score = response["score"] as? Double ?? 0.0
   }

}

