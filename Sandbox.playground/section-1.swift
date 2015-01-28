// Playground - noun: a place where people can play

import UIKit

// normally this would be called protocol RobotDelegate
protocol Listener {
    
    func batteryRunningLow()
    
}

enum RobotSize {
    
    case Tiny
    case Medium
    case Big
    case WorldEnder
    
}

class Robot {
    
    var myHuman: Listener?
    
    var size: RobotSize? {
        
        didSet {
            
            if let s = size {
                
                switch s {
                    
                case .Tiny :
                    
                    batteryPower = 100
                    
                case .Medium :
                    
                    batteryPower = 200
                    
                case .Big :
                    
                    batteryPower = 300
                    
                case .WorldEnder :
                    
                    batteryPower = 1000000
                    
                }
                
            }
            
        }
        
    }
    
    var batteryPower:Int = 100 { // what does this line do now?
        
        didSet {
            
            if batteryPower < 30 {
                
                myHuman?.batteryRunningLow()

            }
            
        }
        
    }
    
    func doTask() {
        
        batteryPower -= 20
        
    }
    
}

class Human: Listener {
    
    var myRobot: Robot?
    
    func makeRobot() {
        
        myRobot = Robot()
        myRobot?.myHuman = self
        myRobot?.size = .Tiny
        
//        myRobot?.myHuman?.batteryRunningLow()
        
    }
    
    func batteryRunningLow() {
        
        println("robot is dying")
        
    }
    
}

//var John = Human()
//
//for i in 0...3 {
//    
//    if let robot = John.myRobot {
//        
//        robot.doTask()
//        
//    } else {
//        
//        John.makeRobot()
//    }
//    
//    John.myRobot?.batteryPower
//    
//}

var Elias = Human()
Elias.myRobot?.size = .Big

Elias.myRobot?.batteryPower

var Bobby = Human()

Bobby.makeRobot()

Bobby.myRobot?.size = .Medium

Bobby.myRobot?.batteryPower

Bobby.myRobot?.doTask()

Bobby.myRobot?.batteryPower

var batteryPower = Bobby.myRobot?.batteryPower

var number = 6

if let bP = batteryPower {
    
    var totalBatteryPower = bP + number
    
}




var random = arc4random_uniform(100) + 1

var luck = ""
switch random {
    
case 1...20 :
    luck = "Bad luck"
case 21...80 :
    luck = "Good luck"
default :
    luck = "Winner"
    
}

enum ArrowKeys: String {
    
    case Up = "The Up Arrow"
    case Down = "The Down Arrow"
    case Left = "The Left Arrow"
    case Right = "The Right Arrow"
    
}

ArrowKeys.Down.rawValue
ArrowKeys.Down.hashValue


for i in 0...10 {
    
    var num = sin(Double(i) % 100)
    
}



