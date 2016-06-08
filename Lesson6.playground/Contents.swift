//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func testIf(int: Int?) {
    //if let int = int
    //if let myInt = int, let v: Int = 3
    //if let myInt = int where int > 5 && int < 7
    //if int == nil
//    let bool = true
//    
//    guard bool else {
//        return
//    }
    
    guard let myInt = int else { return }
    print(myInt)
    print(myInt+5)
    print(myInt*2)

    
}

testIf(nil)

func testDefer(int: Int) {
    let variable = 5
    defer {
        print(variable)
        print("Hello")
    }
    if int > 4 {
        defer {
            print("Ololo")
        }
        if int < 10 {
            return
        }
        guard int == 8 else {
            return
        }
        
    } else {
        return
    }
}

//testDefer(10)
testDefer(3)


var myClosure: ((Int, Int) -> Int)?

func add(first: Int, second: Int) -> Int {
    return first + second
}

func sub(first: Int, second: Int) -> Int {
    return first - second
}


//add(3, second:5)

myClosure?(3, 5)
myClosure = add
myClosure?(5, 3)
myClosure = sub
myClosure?(5, 3)


func calculate(first: Int, second: Int, result: (Int -> ())) {
    let res1 = first+second
    result(res1)
    result(first-second)
}

calculate(5, second: 8) { (res) in
    print(res)
}

func request(param: String, success: (String -> (Int)), error: (String -> ())){
    if param.characters.count > 10 {
        dispatch_after(5, dispatch_get_main_queue(), { 
            _ = success(param)
        })
    } else {
        error("Error")
    }
}

class User {
    let name: String
    
    init(userName: String) {
        name = userName
    }
}

var user1: User? = User(userName: "Bob")

//unowned

request("my lonnnggg str", success: { [weak user1] (result) in
    print(result)
    guard let user = user1 else { return 0 }
    print(user.name)
    return 0
    }) { (err) in
        print(err)
}

func myFunc(param: String) -> Int {
    return 25
}

request("dsfsdfdffdgdfg", success: myFunc) { (err) in }

let myMethod: String -> Int = { str in
    print(str)
    return 1
}

myMethod("safdsf")

let array = [1,10, 6, 5, 13, 2, 3, 4, 5, 6, 7]

let oddArrayBool = array.map { $0%2 == 1 }
oddArrayBool
let oddArray = array.filter { $0%2 == 1 && $0 > 3 }
oddArray

let red = array.reduce(0, combine: *)
red

let sortedArray = array.sort { element1, element2 in
    element1 > element2
}
sortedArray

for (index, element) in sortedArray.enumerate() {
    print(index)
    print(element)
}

let summ = array.enumerate().map { $0 + $1 }
summ

func toupleMethod(first: Int, second: Int) -> (sum: Int, sub: Int) {
    return (first+second, first-second)
}

let (sum, sub) = toupleMethod(5, second: 3)
sum
sub
