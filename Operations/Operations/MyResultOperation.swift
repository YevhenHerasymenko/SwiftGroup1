//
//  MyResultOperation.swift
//  Operations
//
//  Created by Yevhen Herasymenko on 19/07/2016.
//  Copyright © 2016 Yevhen Herasymenko. All rights reserved.
//

import UIKit

class MyResultOperation: NSOperation {
    
    var result: Int?
    
    override func main() {
        print(result)
    }

}
