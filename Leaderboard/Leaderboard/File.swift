//
//  File.swift
//  Leaderboard
//
//  Created by Mollie on 3/4/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

import Foundation

enum AgeGroupType {
    
    case Baby
    case Toddler
    case Child
    case Tween
    case Teen
    case Adult
    
}

class User {
    
    var age: Int = 0
    
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

//mac.age = 21

var group = mac.getAgeGroup()







