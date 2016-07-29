//
//  TrophyTableViewCell.swift
//  TrophyList
//
//  Created by Yevhen Herasymenko on 29/07/2016.
//  Copyright © 2016 Yevhen Herasymenko. All rights reserved.
//

import UIKit

class TrophyTableViewCell: UITableViewCell {

    @IBOutlet weak var trophyDescriptionLabel: UILabel!
    @IBOutlet weak var trophyTitleLabel: UILabel!
    @IBOutlet weak var trophyImageView: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        trophyImageView.image = nil
    }

    
}
