//
//  NetworkManager.swift
//  TrophyList
//
//  Created by Yevhen Herasymenko on 29/07/2016.
//  Copyright © 2016 Yevhen Herasymenko. All rights reserved.
//

import Foundation
import Alamofire

struct NetworkManager {
    
    static func getTrophies(trophiesCallback: ([Trophy] -> ())) {
        Alamofire.request(.GET, NetworkConstants.Url).responseJSON { (result) in
            switch result.result {
            case .Failure: break
            case .Success(let resultArray):
                guard let trophyDictionaries = resultArray as? [[String : AnyObject]] else { return }
                let trophies = trophyDictionaries.map { Trophy(dictionary: $0)}
                trophiesCallback(trophies)
            }
        }
    }
    
}
