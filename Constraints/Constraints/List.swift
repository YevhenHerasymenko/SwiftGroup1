//
//  List.swift
//  Constraints
//
//  Created by Yevhen Herasymenko on 21/06/2016.
//  Copyright © 2016 Yevhen Herasymenko. All rights reserved.
//

import Foundation

class List<T> {
    var selectedElement: ListElement<T>
    
    init(element: ListElement<T>) {
        selectedElement = element
    }
    
    func add(element: ListElement<T>) {
        guard let lastElement = last() else {
            selectedElement = element
            return
        }
        lastElement.next = element
        lastElement.next?.previous = lastElement
    }
    
    func last() -> ListElement<T>? {
        var element = selectedElement
        while element.next != nil {
            element = element.next!
        }
        return element
    }
    
    func next() -> ListElement<T>? {
        guard selectedElement.next != nil else {
            return nil
        }
        selectedElement = selectedElement.next!
        return selectedElement
    }
    
    func previous() -> ListElement<T>? {
        guard selectedElement.previous != nil else {
            return nil
        }
        selectedElement = selectedElement.previous!
        return selectedElement
    }
    
    var isFirst: Bool {
        return selectedElement.previous == nil
    }
    
    var isLast: Bool {
        return selectedElement.next == nil
    }
}

class ListElement<T> {
    var previous: ListElement? = nil
    var next: ListElement? = nil
    let element: T
    
    init(element: T) {
        self.element = element
    }
    
}