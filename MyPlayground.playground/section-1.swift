// Playground - noun: a place where people can play

import UIKit
import CoreGraphics

var names: [String] = ["Jim", "Sue", "Ted"]

var str = "Test" + "test"

names += ["Tom", "Sam"]

str += "My name is"

var info = ["name":"Jo","age":31,"Books":[["title":"Monster"]]]

var num:CGFloat = 0.0
var num1 = 0.0

var total = num + CGFloat(num1)

var rect = CGRectMake(num, num, num, num)


var shapes = ["Circle", "Square", "Triangle"]

for shape in shapes {
    
//    println("shape " + shape)
    
}


for i in 0..<shapes.count {
    
//    println(shapes[i])
    
    
}

for (i, shape) in enumerate(shapes) {
    
//    println(shapes[i])
    var shapeInfo = "\(i) \(shape) in \(shapes)"
    println(shapeInfo)
    
}

var myInfo = ["name":"Mollie","age":30,"brand":"Jamis"]

for (key,value) in myInfo {
    
    if key == "age" {
        
        println("My age is \(value).")
        
    }
    
    switch key {
        
    case "age" :
        
        println("My age is \(value).")
        
    case "name" :
        
        println("My name is \(value).")
        
    default :
        
        println("My \(key) is \(value).")
        
    }
    
}

var number:Int = 0
var isTrue:Bool = true



3.14 % 1

100 / 100 * 60




























