//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func callbackFunc(callback: (String) -> (Int)) {
    callback("one")
    callback("two")
    let value = callback("five")
    print(value + 17)
    print(callback("three"))
    secondCallback(callback)
    secondCallback { str in
        print(str + str)
        return 0
    }
}

func secondCallback(callback: (String) -> (Int)) {
    print("second")
    callback("four")
}

callbackFunc { str in
    print(str)
    return 0
}

let alertController = UIAlertController(title: "aaa", message: "bbb", preferredStyle: .Alert)
alertController

let okAction = UIAlertAction(title: "Okay", style: .Cancel) { (action) in
    print("done")
}

alertController.addAction(okAction)

alertController.view


let view = UIView(frame: CGRectMake(0,0,100,100))
view.backgroundColor = UIColor.redColor()
view


struct Car {
    let name: String
    let maxSpeed: Int
    let draverName: String
}

struct Driver {
    let name: String
}

let car1 = Car(name: "Lada", maxSpeed: 140, draverName: "Ivan")
let car2 = Car(name: "Toyota", maxSpeed: 200, draverName: "Tom")
let cars = [car1, car2]

let drivers = cars.map { (car) -> Driver in
    return Driver(name: car.draverName)
}
drivers

func testGeneric<Type>(myValue: Type) {
    print(myValue)
}

testGeneric("String")
testGeneric(5)
testGeneric(drivers)
testGeneric(car1)


class Stack<T> {
    var elements = [T]()
    
    func push(element: T) {
        elements.append(element)
    }
    
    func pop() -> T? {
        guard !elements.isEmpty else {
            return nil
        }
        return elements.removeLast()
    }
}

let carStack = Stack<Car>()
carStack.push(car1)
carStack.elements


let stringStack = Stack<String>()
stringStack.push("Str")
stringStack


let stra = ["A", "B", "C"]

stra.reduce("", combine: +)


func myPrint(val: String){
    print(val)
}

func myPrint(val: Int) {
    print(val+val)
}

myPrint("Vaaaa")
myPrint(5)