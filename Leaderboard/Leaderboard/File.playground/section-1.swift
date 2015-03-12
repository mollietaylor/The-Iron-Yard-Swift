// Playground - noun: a place where people can play

import UIKit

enum AgeGroupType {
    
    case Baby
    case Toddler
    case Child
    case Tween
    case Teen
    case Adult
    
    func name() -> String {
        
        switch self {
            
        case .Baby : return "Baby"
        case .Toddler : return "Toddler"
        case .Child : return "Child"
        case .Tween : return "Tween"
        case .Teen : return "Teen"
        case .Adult : return "Adult"
            
            
        }
        
    }
    
}

class User {
    
    var age: Int = 0
    
    // instance function
    func getAgeGroup() -> AgeGroupType {
        
        switch age {
            
        case 0,1 : return .Baby
        case 2...4 : return .Toddler
        case 5...10 : return .Child
        case 11...12 : return .Tween
        case 13...17 : return .Teen
        default : return .Adult
            
        }
        
    }
    
}

var mac = User()

mac.age = 21

mac.getAgeGroup().name()

func weeksOld(age: Int) -> Int {
    
    return age * 52
    
}

weeksOld(mac.age)


// a global function should care only about the parameters that are passed in, and nothing else
func monthsOld(age: Int) -> Int {
    
    return age * 12
    
}

class Car {
    
    var age: Int = 0
    
    init() {
        
        
        
    }
    
    // class method
    // does not care about an instance object
    // does not need a state
    // use these less often. instead, use custom initializers
    // function that does not care about a specific object, but it does matter what type of class you're working with
    // cares about a class type, but doesn't care about an object
    // e.g. what happens if I mix this color with that color?
    class func seatsInModel(model:String) -> Int {
        
        return 4
        
    }
    
}

var mustang = Car()
mustang.age = 10

Car.seatsInModel("model")

Car()



