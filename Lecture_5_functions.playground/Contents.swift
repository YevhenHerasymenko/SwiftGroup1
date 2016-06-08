//: Playground - noun: a place where people can play

import UIKit

struct User {
    let name: String

    static func testUsers() -> [User] {
        return [User(name: "Ostap"), User(name: "Andrew")]
    }

    static func userNamesString(users: [User]) -> String {
        var string = ""
        for user in users {
            string = string + user.name
            string += " ,"
        }
        return string
    }
}

//let instance = User(name: "Someone")
//User.printHello(5, name: "test")

let testUsers = User.testUsers()
let names = User.userNamesString(testUsers)
names

let test = User(name: "test")

func doOk() {
    print("ok")
}

func returnOptional(shouldReturn: Bool?) -> String? {
    if shouldReturn == true {
        return "ok"
    } else {
        return nil
    }
}
//
returnOptional(true)
returnOptional(false)
returnOptional(nil)




func printNumbers(limit: Int = 10, endString: String? = nil) -> Int {
    for i in 0..<limit {
        if i > 0 && (i % 10 == 0) {
            continue
        }
        print(i)
    }
    if let string = endString {
        print(string)
    }
    return limit - 1
}
let limit: Int = 10
let result = printNumbers(endString: "test")


class Car {
    let price: Float?


    init?(carPrice: Float) {
        if carPrice < 0 {
            return nil
        }
        self.price = carPrice
    }
}
var cars: [Car] = []

if let car = Car(carPrice: -1) {
    cars.append(car)
}
if let car = Car(carPrice: 200) {
    cars.append(car)
}

//cars.append(car)

func filterCars(cars: [Car], byPrice price: Float) -> [Car] {
    var filteredCars: [Car] = []
    for dog in cars {
        if dog.price <= price {
            filteredCars.append(dog)
        }
    }
    return filteredCars
}

filterCars(cars, byPrice: 250)

let numbers: [Int?] = [1, 2, 3, nil, 4, 5]
var nonOptNumbers: [Int] = []
for number in numbers {
    if let number = number {
        nonOptNumbers.append(number)
    }
}
nonOptNumbers
let nonOptNumbers1 = numbers.flatMap{$0}
nonOptNumbers1
//numbers.append(1)

