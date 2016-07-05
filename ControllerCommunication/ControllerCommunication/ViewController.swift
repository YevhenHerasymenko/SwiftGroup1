//
//  ViewController.swift
//  ControllerCommunication
//
//  Created by Yevhen Herasymenko on 05/07/2016.
//  Copyright © 2016 Yevhen Herasymenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var collectionOfImages: [UIImageView]!
    @IBOutlet var collectionOfLabels: [UILabel]!
    
    let imageNames = ["image1", "image2", "image3", "image4"]
    let texts = ["nature 1", "nature 2", "nature 3", "nature 4"]
    
    var index: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for (index, imageView) in collectionOfImages.enumerate() {
            imageView.userInteractionEnabled = true
            imageView.image = UIImage(named: imageNames[index])
            let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(openNatureDetails(_:)))
            imageView.addGestureRecognizer(tapRecognizer)
        }
        for (index, label) in collectionOfLabels.enumerate() {
            label.text = texts[index]
        }
        
        let swipeRecognizer = UISwipeGestureRecognizer()
        swipeRecognizer.direction = [.Down, .Left, .Right]
    }
    
    func openNatureDetails(sender: UITapGestureRecognizer) {
        guard let imageView = sender.view as? UIImageView,
            let index = collectionOfImages.indexOf(imageView) else { return }
        self.index = index
        //performSegueWithIdentifier("showSegue", sender: nil)
        //performSegueWithIdentifier("showSegue", sender: index)
        let detailsController = storyboard?.instantiateViewControllerWithIdentifier("detailsController") as! DetailsViewController
        detailsController.text = texts[index]
        detailsController.imageName = imageNames[index]
        navigationController?.pushViewController(detailsController, animated: true)
        
        
        //Int(arc4random_uniform(6))
        
        
    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        guard let detailsController = segue.destinationViewController as? DetailsViewController, let index = sender as? Int else { return }
//        detailsController.imageName = imageNames[index]
//        detailsController.text = texts[index]
//    }

}

