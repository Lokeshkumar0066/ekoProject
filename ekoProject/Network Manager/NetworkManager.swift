//
//  NetworkManager.swift
//  ekoProject
//
//  Created by Lokesh on 21/01/20.
//  Copyright © 2020 Lokesh. All rights reserved.
//

import UIKit
import Alamofire

typealias networkCompletionHandler = (_ responseJSON: AnyObject?, _ error: Error?) -> (Void)


class NetworkManager: NSObject {
    
    static let sharedInstance: NetworkManager = NetworkManager()
    
    
    //MARK: GET Request
    func getRequestWithDataResponse(url urlString:String, completionHandler: @escaping networkCompletionHandler) -> Void {
        
        let headers = [
            "content-type": "application/json",
            "accept" : "application/json",
            "X-RateLimit-Limit": "60",
            "X-RateLimit-Remaining": "60",
            "X-RateLimit-Reset": "1372700873"
//            "client_id" : "2630cc8753dacdeb04fa",
//            "client_secret" : "b961591784ce23fbf0a13aaec3b11c0e99ecde33"
        ]
        
        Alamofire.request(urlString, method: .get, parameters: nil, encoding:  URLEncoding.httpBody, headers: headers).responseJSON { (response:DataResponse<Any>) in
            
            switch(response.result) {
            case.success(let data):
                print("success",data)
                completionHandler (data as AnyObject, nil)
            case.failure(let error):
                print("Not Success",error.localizedDescription)
                completionHandler (nil, error)
            }
        }
    }
}
