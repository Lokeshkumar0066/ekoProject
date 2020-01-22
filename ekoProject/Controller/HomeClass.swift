//
//  HomeClass.swift
//  ekoProject
//
//  Created by Lokesh on 21/01/20.
//  Copyright © 2020 Lokesh. All rights reserved.
//

import UIKit
import MBProgressHUD
class HomeClass: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var usersViewModel: [UsersViewModel] = []
    var pageCount = 1
    let spinner = UIActivityIndicatorView(style: .gray)
//    var previousTimestamp: CFTimeInterval = 0
//    var frameCount = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // #1 - The UITableViewDataSource and
        // UITableViewDelegate protocols are not
        // adopted in extensions.
        
//        previousTimestamp = CFAbsoluteTimeGetCurrent()
//        let displayLink = CADisplayLink(target: self, selector: #selector(handle(_:)))
//        displayLink.add(to: RunLoop.current, forMode: .common)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 120
        tableView.estimatedRowHeight = UITableView.automaticDimension
        self.serviceFetchUsersList(isLoader: true)
    }
    
//    @objc func handle(_ displayLink: CADisplayLink?) {
//        let now = CFAbsoluteTimeGetCurrent()
//        let elapsed = now - previousTimestamp
//        frameCount += 1
//
//        if elapsed > 1.0 {
//            let fps = CGFloat(Double(frameCount) / elapsed)
//            DispatchQueue.main.async(execute: {
//                print("\(String(format: "%.1f fps", fps))")
//            })
//            previousTimestamp = now
//            frameCount = 0
//        }
//    }
    
    @IBAction func onClickRefresh(_ sender: Any) {
        pageCount = 1
        self.usersViewModel = []
        self.tableView .reloadData()
        self.serviceFetchUsersList(isLoader: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func serviceFetchUsersList(isLoader:Bool){
        
        if Connectivity.isConnectedToInternet{
            if isLoader{
                let loadingNotification = MBProgressHUD.showAdded(to: self.view, animated: true)
                loadingNotification.mode = MBProgressHUDMode.indeterminate
            }

            let serviceURL = "https://api.github.com/search/users?q=repos:>=0&page=" + String(self.pageCount) + "&per_page=10"
            let urlString = serviceURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            NetworkManager.sharedInstance.getRequestWithDataResponse(url: urlString!) { (response, error) -> (Void) in
                if error == nil{
                    if isLoader{
                        self.usersViewModel = []
                        MBProgressHUD.hide(for: self.view, animated: true)
                    }
                    self.spinner.stopAnimating()
                    let data:[String:Any] = response as? [String:Any] ?? [:]
                    if data.count > 0{
                        let usersList = data["items"] as? [AnyObject] ?? []
                        if usersList.count > 0{
                            for dict in usersList{
                                let dataModel =  UsersDataModel(response: dict as! [String: Any])
                                self.usersViewModel.append(UsersViewModel(usersDataModel: dataModel))
                            }
                            self.pageCount = self.pageCount + 1
                        }else{
                            self.view.makeToast("No more user list found.")
                        }
                    }else{
                         self.view.makeToast("No record found.")
                    }
                    
                    self.tableView .reloadData()
                }else{
                    self.showAlert(message: error?.localizedDescription ?? "Something went wrong")
                    if isLoader{
                        MBProgressHUD.hide(for: self.view, animated: true)
                    }
                    self.spinner.stopAnimating()
                }
            }
        }else{
            self.view.makeToast("Internet connection appears to be offline, please check your internet connectivity.")
        }
    }
    
    //MARK: Pagination Scroll
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let offset: Float = (Float(scrollView.contentOffset.y - (scrollView.contentSize.height - scrollView.frame.size.height)))
        
        let arrayCount:Float = Float(self.usersViewModel.count)
        if offset >= 0 {
            if offset <= arrayCount {
                spinner.startAnimating()
                spinner.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 44)
                self.tableView.tableFooterView = spinner
                self.serviceFetchUsersList(isLoader: false)
            }
        }
    }
    

}

