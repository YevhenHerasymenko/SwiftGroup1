//
//  DetailsSegue.swift
//  ControllerCommunication
//
//  Created by Yevhen Herasymenko on 05/07/2016.
//  Copyright © 2016 Yevhen Herasymenko. All rights reserved.
//

import UIKit

class DetailsSegue: UIStoryboardSegue {
    
    override func perform() {
        super.perform()
        guard let detailsController = destinationViewController as? DetailsViewController,
            let sourceController = sourceViewController as? ViewController, let index = sourceController.index else { return }
        detailsController.imageName = sourceController.imageNames[index]
        detailsController.text = sourceController.texts[index]
    }

}
