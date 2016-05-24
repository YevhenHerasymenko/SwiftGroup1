//: Playground - noun: a place where people can play

import UIKit

var firstName = "Hello, playground"
let str1: String = "Hello, playground"

var str2: String
str2 = "Hello"

var number: Int? = 5
number = nil
number = 67


var str3: String! = "Helllllo"
//str3 = nil
print(str3.characters)


var number1: CGFloat = 5.5


var number2 = number = 5
number2
print(number2)

var isShown:Bool = true



class User {
    var name: String
    let age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func showInfo() {
        print(self.name)
        print(self.age)
        subFunc(str: "Hello")
    }
    
    func subFunc(str str: String) {
        print(str)
    }
}

class MyClass {
    var user: User = User(name: "Ira", age: 12)
}


let myObject = MyClass()
myObject.user.name
myObject.user.age

var user = User(name: "Valera", age: 12)
user.showInfo()








var user1 = user
user.name
user1.name = "Vasia"
user.name
user1.name















