//
//  ContactPreviewCell.swift
//  TableView
//
//  Created by Wild Deer on 26.07.16.
//  Copyright © 2016 spalah. All rights reserved.
//

import UIKit

protocol ReusableCell: class {
    static var nib: UINib { get }
    static var reuseIdentifier: String { get }
}

extension ReusableCell {
    static var reuseIdentifier: String {
        return String(self) + "ReuseIdentifier"
    }

    static var nib: UINib {
        let bundle = NSBundle(forClass: self)
        return UINib(nibName: String(self), bundle: bundle)
    }
}

class ContactPreviewCell: UITableViewCell {
    @IBOutlet weak var contactNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layoutMargins = UIEdgeInsetsZero
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension ContactPreviewCell: ReusableCell {}
