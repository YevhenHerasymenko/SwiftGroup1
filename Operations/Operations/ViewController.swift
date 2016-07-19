//
//  ViewController.swift
//  Operations
//
//  Created by Yevhen Herasymenko on 19/07/2016.
//  Copyright © 2016 Yevhen Herasymenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let blockOperation = NSBlockOperation {
            
        }
        
        let operationQueue = NSOperationQueue()
        let sumOperation = MySumOperation(a: 5, b: 6)
        let resultOperation = MyResultOperation()
        sumOperation.completionBlock = {
            resultOperation.result = sumOperation.sum
        }
        resultOperation.completionBlock = {
            dispatch_async(dispatch_get_main_queue(), { 
                self.view.backgroundColor = UIColor.greenColor()
            })
            
            NSOperationQueue.mainQueue().addOperationWithBlock({ 
                
            })
        }
        resultOperation.addDependency(sumOperation)
        operationQueue.addOperation(sumOperation)
        operationQueue.addOperation(resultOperation)
    }
}

