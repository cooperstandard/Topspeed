//
//  DriverModel.swift
//  TopSpeed
//
//  Created by Cooper Standard on 5/2/22.
//

import Foundation
import Combine
struct Racer: Codable, Hashable{
    
    var racerID: Int
    var racerName: String?
    var points: Int?
    var birthday: String?
    var wins: Int?
    var losses: Int?
    var hometown: String?
    var racerEmail: String?
    var racerPhoneNumber: String?
    var racerAddress: String?
    var racerEmergencyNum: String?
    

    
    static func == (lhs: Racer, rhs: Racer) -> Bool {
        return (lhs.racerID == rhs.racerID)
    }
    
}
    



    
