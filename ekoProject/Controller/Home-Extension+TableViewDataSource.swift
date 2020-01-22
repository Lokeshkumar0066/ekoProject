//
//  VC-Extension+TableViewDataSource.swift
//  ekoProject
//
//  Created by Lokesh on 21/01/20.
//  Copyright © 2020 Lokesh. All rights reserved.
//

import UIKit
import AlamofireImage
// MARK: - UITableView Data Source


extension HomeClass : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeCellClass
        cell.selectionStyle = UITableViewCell.SelectionStyle .none
        cell.viewInformation.cornerRadiusForView()
        
        cell.imgAvatar.af_setImage(withURL: URL(string: usersViewModel[indexPath.row].userDetails.avatar_url)!)
        
        cell.lblLoginUser.text = usersViewModel[indexPath.row].loginName
        
        cell.lblGithubURL.text = usersViewModel[indexPath.row].userDetails.html_url
        
        cell.lblAccountType.text = usersViewModel[indexPath.row].accountType

        if usersViewModel[indexPath.row].userDetails.site_admin{
            cell.imgSiteAdmin.image = UIImage(named:"tick.png")
        }else{
            cell.imgSiteAdmin.image = UIImage(named:"cross.png")
        }
        
        let font: UIFont = UIFont()
        cell.lblLoginUser.font = UIFontMetrics(forTextStyle: .headline).scaledFont(for: font.dynamicFontForHeading())
        cell.lblLoginUser.adjustsFontForContentSizeCategory = true
        
        cell.lblGithubURL.font = UIFontMetrics(forTextStyle: .footnote).scaledFont(for: font.dynamicFontForFootNote())
        cell.lblGithubURL.adjustsFontForContentSizeCategory = true
        
        cell.lblAccountType.font = UIFontMetrics(forTextStyle: .footnote).scaledFont(for: font.dynamicFontForFootNoteTwo())
        cell.lblAccountType.adjustsFontForContentSizeCategory = true
        
        cell.lblSiteAdmin.font = UIFontMetrics(forTextStyle: .body).scaledFont(for: font.dynamicFontForBody())
        cell.lblSiteAdmin.adjustsFontForContentSizeCategory = true

        
        //Make Your button visibility based on true or false
        let isFavorite = self.getIsFavouriteStatus(usersViewModel[indexPath.row])
        
        cell.switchFavourite.isOn = isFavorite
        cell.switchFavourite.tag = indexPath.row
        cell.switchFavourite.addTarget(self, action: #selector(favUnfavButtonAction), for: .valueChanged)
        
        return cell
    }
    
    func getIsFavouriteStatus(_ model: UsersViewModel) -> Bool {
        let predicate = NSPredicate(format: "userID == %@", "\(model.userDetails.id)")

        if let dataModel = CoreDataHelper.getDataForClass(UserTable.self, predicate: predicate).first {
            return dataModel.favoriteStatus
        }

        return false
    }
    
    @objc func favUnfavButtonAction(_ sender: UISwitch) {
        sender.isOn = !sender.isOn
        
        let model = usersViewModel[sender.tag]
        
        let predicate = NSPredicate(format: "userID == %@", "\(model.userDetails.id)")
        
        if let dataModel = CoreDataHelper.getDataForClass(UserTable.self, predicate: predicate).first {
            dataModel.favoriteStatus = sender.isOn
        } else {
            let dataModel = CoreDataHelper.getInstanceOfModelClass(UserTable.self)
            dataModel.userID = "\(model.userDetails.id)"
            dataModel.favoriteStatus = sender.isOn
        }
    
        AppDelegate.instance.saveContext()
    }
    
}
