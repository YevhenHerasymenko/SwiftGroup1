//
//  ViewController.swift
//  FirstGetRequest
//
//  Created by Yevhen Herasymenko on 22/07/2016.
//  Copyright © 2016 Yevhen Herasymenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var userAvatar: UIImageView!
    
    var user: User? = nil {
        didSet {
            let operation = NSBlockOperation { 
                self.updateUI()
            }
            NSOperationQueue.mainQueue().addOperation(operation)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.getUser {[weak self] (answer) in
            switch answer {
            case .Success(let user):
                guard let strongSelf = self else { return }
                strongSelf.user = user
            case .Failure(let error):
                print(error)
            }
        }
    }
    
    func updateUI() {
        if let avatar = user?.avatarUrl,
            let avatarUrl = NSURL(string: avatar),
            let photoData = NSData(contentsOfURL: avatarUrl) {
            let image = UIImage(data: photoData)
            userAvatar.image = image
        }
    }
}

