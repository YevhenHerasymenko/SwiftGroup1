//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

struct Animal {
    
    enum AnimalType {
        case Cat
        case Dog
        case Lion
    }
    
    let animalType: AnimalType
    let name: String
    let age: Int?
    
    init(age: Int) {
        animalType = AnimalType.Cat
        name = "Cat"
        self.age = age
    }
    
    func isOldCat() {
        if age > 8 {
            print("It Is Old Cat")
        } else if age < 2 {
            print("It is Young Cat")
        } else {
            print("It isn`t Old Cat")
        }
        
        if let animalAge = age {
            print(animalAge)
        }
        
        
    }
    
}

let oldCat = Animal(age: 10)
let youngCat = Animal(age: 1)

oldCat.isOldCat()
youngCat.isOldCat()

var animalsArray: [Animal] = [oldCat, youngCat]

let myCat = Animal(age: 3)

animalsArray.append(myCat)

let index = 2
if index < animalsArray.count {
    animalsArray[index]
}

animalsArray.count


let numbersArray = 0...100


var j = 0
j = j - 1
j-=1

for animal in animalsArray {
    animal.isOldCat()
}

var i = 0
while i < animalsArray.count {
    animalsArray[i].isOldCat()
    i+=1
}

Animal.AnimalType.Cat



struct Weel {
    let radius: Int
    let width: Int
}

struct Car {
    let model: String
    let weel: Weel
    
}