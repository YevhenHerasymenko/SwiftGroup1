//
//  ViewController.swift
//  ViewControllerLifeCicle
//
//  Created by Yevhen Herasymenko on 01/07/2016.
//  Copyright © 2016 Yevhen Herasymenko. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    lazy var mass: [Int] = {
        print("init")
        return [1,2,3,4,5]
        }()

    override func viewDidLoad() {
        super.viewDidLoad()
        print("load " + String(FirstViewController))
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("will appear " + String(FirstViewController))
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("did appear " + String(FirstViewController))
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("will disappear" + String(FirstViewController))
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("did disappear" + String(FirstViewController))
    }
    
    deinit {
        print("deinit " + String(FirstViewController))
    }

}

