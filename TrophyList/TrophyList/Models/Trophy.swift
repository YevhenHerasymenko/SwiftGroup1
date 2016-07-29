//
//  Trophy.swift
//  TrophyList
//
//  Created by Yevhen Herasymenko on 29/07/2016.
//  Copyright © 2016 Yevhen Herasymenko. All rights reserved.
//

import Foundation

struct TrophyKey {
    static let Title = "title"
    static let Description = "description"
    static let Image = "image"
}

struct Trophy {
    let description: String
    let title: String
    let image: String
    
    init(dictionary: [String : AnyObject]) {
        description = dictionary[TrophyKey.Description] as! String
        title = dictionary[TrophyKey.Title] as! String
        image = dictionary[TrophyKey.Image] as! String
    }
}
