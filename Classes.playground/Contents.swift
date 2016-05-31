//: Playground - noun: a place where people can play

import UIKit

for i in 1...100 {
    if i%2 == 0 {
        continue
    }
    if i == 51 {
        break
    }
    i
}

class Pupil {
    var str: String!
    
    func myOpenFunc() {
        myTestFunc()
    }
    
    private func myTestFunc() {
        
    }
}

class School {
    var pupil: Pupil!
    
    func myFunc() {
        pupil.myOpenFunc()
    }
}


class Human {
    var name: String!
    
    func testFunc() {
        
    }
    
    func call() {
        print("I am a Human")
    }
}

class Worker: Human, MyProtocol {
    
    var variable: Int!
    
    func myFunc() {
        name
        testFunc()
        call()
    }
    
    override func call() {
        super.call()
        print("I am a Worker")
    }
    
    func myProtocolFunc() {
        
    }
    
}


class PlantWorker: Worker {
    
//    var _plantName: String!
    private var plantName: String! {
//        willSet {
//            
//        }
        didSet {
            
        }
//        get {
//            return _plantName
//        }
//        set {
//            _plantName = newValue
//        }
    }
    
    func plantFunc() {
        plantName = "Google"
    }
    

}

class MyClass {
    
    var whatever: Any! = "sdfsd"
    
    var variable: Int!
    


}

extension MyClass: MyProtocol {
    
    func myProtocolFunc() {
        whatever = MyTestClass()
    }
    
}

struct MyStruct {
    
}

class MyTestClass {
    
}

extension MyClass {
    //var str: String!
    
    func myExtensionFunc() {
        
    }
    
}

protocol MyProtocol {
    
    var variable: Int! { get set }
    
    func myProtocolFunc()
    func secondProtocolFunc()
    
}

extension MyProtocol where Self: Worker {
    
    func secondProtocolFunc() {
        name
    }
    
}

extension MyProtocol {
    
    func secondProtocolFunc() {
        
    }
    
}

