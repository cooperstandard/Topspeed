//
//  TourneyModel.swift
//  TopSpeed
//
//  Created by Cooper Standard on 6/8/22.
//

import Foundation

struct Tourney: Codable, Comparable {
    
    
    var tourneyID : Int
    var tourneyName : String
    var tourneyStartDate : String
    var tourneyEndDate : String
    var tourneyLocation : String
    var classes : [String] = []
    
    
    static func < (lhs: Tourney, rhs: Tourney) -> Bool {
        return lhs.tourneyID <= rhs.tourneyID
    }
    
    
}
