//
//  RaceModel.swift
//  TopSpeed
//
//  Created by Cooper Standard on 5/3/22.
//

import Foundation

struct Race: Codable {
    var racerID : Int
    var heatID : Int
    var motoID : Int
    var opponentID : Int?
    var startTime : String?
    var details : [String : String]
    
    
    static func copy(other: Race) -> Race {
        var race = Race(racerID: other.racerID, heatID: other.heatID, motoID: other.motoID, opponentID: other.opponentID, startTime: other.startTime, details: [:])
        for key in other.details.keys {
            race.details[key] = other.details[key]
        }
        
        return race
        
    }
    
    
}
