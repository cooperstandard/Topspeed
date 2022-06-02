//
//  BikeModel.swift
//  TopSpeed
//
//  Created by Cooper Standard on 5/10/22.
//

import Foundation

struct Bike: Codable {
    var id: Int
    var racerID: Int
    var bikeNum: Int
    var bikeManufacturer: String
    var bikeModel: String
    var bikeYear: Int
    var bodyMake: String
    var bodyYear: Int
    
    var details: [String: String]
}

