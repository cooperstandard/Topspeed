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
    
    init(racerID: Int){
        self.id = 0
        self.racerID = racerID
        self.bikeNum = 0
        self.bikeManufacturer = ""
        self.bikeModel = ""
        self.bikeYear = 0
        self.bodyMake = ""
        self.bodyYear = 0
        self.details = [:]
    }
    
    init(id: Int, racerID: Int, bikeNum: Int, bikeManufacturer: String, bikeModel: String, bikeYear: Int, bodyMake: String, bodyYear: Int ,details: [String: String]){
        self.id = id
        self.racerID = racerID
        self.bikeNum = bikeNum
        self.bikeManufacturer = bikeManufacturer
        self.bikeModel = bikeModel
        self.bikeYear = bikeYear
        self.bodyMake = bodyMake
        self.bodyYear = bodyYear
        self.details = details
    }
   
}

