//
//  UsersDetailedClassVC.swift
//  ekoProject
//
//  Created by Lokesh on 21/01/20.
//  Copyright © 2020 Lokesh. All rights reserved.
//

import UIKit
import WebKit

class UsersDetailedClassVC: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    var webViewURL: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: webViewURL)!
        webView.load(URLRequest(url: url))
        webView.navigationDelegate = self
        webView.allowsBackForwardNavigationGestures = true
    }
    
    

}
