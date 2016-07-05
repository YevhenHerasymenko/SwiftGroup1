//
//  DetailsViewController.swift
//  ControllerCommunication
//
//  Created by Yevhen Herasymenko on 05/07/2016.
//  Copyright © 2016 Yevhen Herasymenko. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var infoLabel: UILabel!
    
    var imageName: String!
    var text: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: imageName)
        infoLabel.text = text
    }

}
