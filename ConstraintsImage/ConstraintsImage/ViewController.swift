//
//  ViewController.swift
//  ConstraintsImage
//
//  Created by Yevhen Herasymenko on 24/06/2016.
//  Copyright © 2016 Yevhen Herasymenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var leftImageConstraint: NSLayoutConstraint!
    @IBOutlet var imageView: UIImageView!
    
    var topConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

//MARK: - Actions
extension ViewController {
    
    @IBAction func buttonAction(sender: AnyObject) {
        UIView.animateWithDuration(2) {
            self.leftImageConstraint.constant += 30
            self.topConstraint.constant += 50
            self.view.layoutIfNeeded()
        }
        
    }
    
}

//MARK: - Setup UI
extension ViewController {
    func setupUI() {
        imageView.image = UIImage(named: "user")
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = imageView.frame.height/2
        
        addView()
    }
    
    func addView() {
        let myRect = CGRectMake(imageView.frame.maxX, imageView.frame.minY, imageView.frame.width, imageView.frame.height)
        let myView = UIView(frame: myRect)
        myView.backgroundColor = UIColor.redColor()
        view.addSubview(myView)
        addConstraintToView(myView)
    }
    
    func addConstraintToView(myView: UIView) {
        myView.translatesAutoresizingMaskIntoConstraints = false
        topConstraint = NSLayoutConstraint(item: myView, attribute: .Top, relatedBy: .Equal, toItem: view, attribute: .Top, multiplier: 1, constant: 40)
        topConstraint.active = true
        NSLayoutConstraint(item: myView, attribute: .Left, relatedBy: .Equal, toItem: imageView, attribute: .Right, multiplier: 1, constant: 0).active = true
        NSLayoutConstraint(item: myView, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 100).active = true
        NSLayoutConstraint(item: myView, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 100).active = true
    }
}

