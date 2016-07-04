//
//  ThirdViewController.swift
//  ViewControllerLifeCicle
//
//  Created by Yevhen Herasymenko on 01/07/2016.
//  Copyright © 2016 Yevhen Herasymenko. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(navigationController)
        //tabBarController
        //splitViewController
        //print(presentedViewController)
        print(presentingViewController)
    }

    @IBAction func close(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func push(sender: AnyObject) {
        //let storyboard = UIStoryboard(name: "FirstTab", bundle: NSBundle.mainBundle())
        guard let storyboard = storyboard else { return }
        let controller = storyboard.instantiateViewControllerWithIdentifier("firstVC")
        presentViewController(controller, animated: true, completion: nil)
        
        
        navigationController?.pushViewController(controller, animated: true)
    }
}
