//
//  Home-Extension+TableViewDelegate.swift
//  ekoProject
//
//  Created by Lokesh on 21/01/20.
//  Copyright © 2020 Lokesh. All rights reserved.
//

import UIKit
import Foundation
// MARK: - UITableView Delegate

extension HomeClass : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let story:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController : UsersDetailedClassVC = story.instantiateViewController(withIdentifier: "UsersDetailedClassVC") as! UsersDetailedClassVC
        viewController.webViewURL = usersViewModel[indexPath.row].userDetails.html_url
        self.navigationController!.pushViewController(viewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    

    
}
