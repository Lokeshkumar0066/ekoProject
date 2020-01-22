//
//  HomeCellClass.swift
//  ekoProject
//
//  Created by Lokesh on 21/01/20.
//  Copyright © 2020 Lokesh. All rights reserved.
//

import UIKit

class HomeCellClass: UITableViewCell {

    @IBOutlet weak var viewInformation: UIView!
    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var lblLoginUser: UILabel!
    @IBOutlet weak var lblGithubURL: UILabel!
    @IBOutlet weak var lblAccountType: UILabel!
    @IBOutlet weak var lblSiteAdmin: UILabel!
    @IBOutlet weak var switchFavourite: UISwitch!
    @IBOutlet weak var imgSiteAdmin: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
