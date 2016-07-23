//
//  NetworkManager.swift
//  FirstGetRequest
//
//  Created by Yevhen Herasymenko on 22/07/2016.
//  Copyright © 2016 Yevhen Herasymenko. All rights reserved.
//

import Foundation
import Alamofire

enum Answer {
    case Success(User)
    case Failure(Error)
}

enum Error {
    case Request
    case Data
    case Serialization
}

class NetworkManager {
    
    class func getUser(userCallback: Answer -> () ){
//        let session = NSURLSession.sharedSession()
//        guard let url = NSURL(string: NetworkConstants.userUrl) else { return }
//        let task = session.dataTaskWithURL(url) { (data, response, error) in
//            guard error == nil else {
//                userCallback(Answer.Failure(Error.Request))
//                return
//            }
//            guard let data = data else {
//                userCallback(Answer.Failure(Error.Data))
//                return
//            }
//            NetworkManager.parse(data, withCallback: userCallback)
//        }
//        task.resume()
        request(.GET, NetworkConstants.userUrl).responseJSON { results in
            switch results.result {
            case .Success(let content):
                let contentDictionary = content as! [String : AnyObject]
                let user = User(dictionary: contentDictionary)
                userCallback(Answer.Success(user))
            case .Failure: break
            }
            
        }
    }
    
    class func parse(data: NSData, withCallback callback: Answer -> ()) {
        do {
            guard let userDictionary = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as? [String : AnyObject] else {
                callback(Answer.Failure(Error.Serialization))
                return
            }
            let user = User(dictionary: userDictionary)
            callback(Answer.Success(user))
        } catch {
            callback(Answer.Failure(Error.Serialization))
        }
    }
    
}