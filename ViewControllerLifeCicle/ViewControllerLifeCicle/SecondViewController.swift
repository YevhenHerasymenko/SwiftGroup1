//
//  SecondViewController.swift
//  ViewControllerLifeCicle
//
//  Created by Yevhen Herasymenko on 01/07/2016.
//  Copyright © 2016 Yevhen Herasymenko. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("load " + String(SecondViewController))
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("will appear " + String(SecondViewController))
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("did appear " + String(SecondViewController))
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("will disappear" + String(SecondViewController))
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("did disappear" + String(SecondViewController))
    }
    
    deinit {
        print("deinit " + String(SecondViewController))
    }

}
