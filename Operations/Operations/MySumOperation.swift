//
//  MySumOperation.swift
//  Operations
//
//  Created by Yevhen Herasymenko on 19/07/2016.
//  Copyright © 2016 Yevhen Herasymenko. All rights reserved.
//

import UIKit

class MySumOperation: NSOperation {
    
    private let a: Int
    private let b: Int
    var sum: Int?
    
    init(a: Int, b: Int) {
        self.a = a
        self.b = b
    }
    
    override func main() {
        sum = a + b
    }

}
