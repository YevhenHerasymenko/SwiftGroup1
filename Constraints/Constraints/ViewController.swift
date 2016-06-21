//
//  ViewController.swift
//  Constraints
//
//  Created by Yevhen Herasymenko on 21/06/2016.
//  Copyright © 2016 Yevhen Herasymenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    var list: List<Person>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let firstPerson = Person(name: "Oleg")
        let firstElement = ListElement<Person>(element: firstPerson)
        list = List<Person>(element: firstElement)
        
        let names = ["Anna", "Ivan", "Andrey", "Denis"]
        let elements = names.map{ Person(name: $0)}.map { ListElement<Person>(element: $0) }
        for element in elements {
            list.add(element)
        }
        nameLabel.text = list.selectedElement.element.name
        checkState()

    }
    
    func checkState() {
        previousButton.hidden = list.isFirst
        nextButton.hidden = list.isLast
    }

    @IBAction func previous(sender: UIButton) {
        nameLabel.text = list.previous()?.element.name
        checkState()
    }

    @IBAction func next(sender: UIButton) {
        nameLabel.text = list.next()?.element.name
        checkState()
    }
}

