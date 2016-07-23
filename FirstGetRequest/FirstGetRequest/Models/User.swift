//
//  User.swift
//  FirstGetRequest
//
//  Created by Yevhen Herasymenko on 22/07/2016.
//  Copyright © 2016 Yevhen Herasymenko. All rights reserved.
//

import Foundation

private struct UserKeys {
    static let results = "results"
    static let gender = "gender"
    static let name = "name"
    static let last = "last"
    static let first = "first"
    static let phone = "phone"
    static let picture = "picture"
    static let medium = "medium"
}

enum Gender: String {
    case Male = "male"
    case Female = "female"
}

struct UserName {
    let firstName: String
    let lastName: String
}

struct User {
    
    let gender: Gender?
    let name: UserName?
    let avatarUrl: String?
    let phone: String?
    
    init(dictionary: [String : AnyObject]) {
        let resultsArray = dictionary[UserKeys.results] as! [[String : AnyObject]]
        let results = resultsArray.first!
        let genderString = results[UserKeys.gender] as! String
        gender = Gender(rawValue: genderString)
        let nameInfo = results[UserKeys.name] as! [String : String]
        let firstName = nameInfo[UserKeys.first]!
        let lastName = nameInfo[UserKeys.last]!
        name = UserName(firstName: firstName, lastName: lastName)
        phone = results[UserKeys.phone] as? String
        let avatarInfo = results[UserKeys.picture] as! [String : String]
        avatarUrl = avatarInfo[UserKeys.medium]
    }
    
}
