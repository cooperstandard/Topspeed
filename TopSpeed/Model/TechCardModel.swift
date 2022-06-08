//
//  TechCardModel.swift
//  TopSpeed
//
//  Created by Cooper Standard on 5/2/22.
//

import Foundation

struct TechCard: Codable {
    var techCardID : Int
    var racer: Racer? // racerID
    var bike: Bike?// bikeID
    var raceClass: String?// can do enum for check
    var approved: Bool?
   
    var rejectionNote: String?
    
    // Not in DB should add to racer object
    var licenseNum: String?
    var licenseExpr: String?
    
    //var techDetails: [String: String]
    /*  can make a dictionary of tech deails with this stuff
     var racerName: String  //racer.racerName
     var address: String //racer.racerAddress // city state and zip as well
     var city: String
     var state: String
     var zip: String
     var age: Int
     var email:  String //racer.racerEmail
     var racerEMC: String // racer.racerEmergencyContact
     var Occupation: String  // racer occupation idk
     var liscenceNum: String // can make a check function
     var liscenceExp: String
     */
    
    init(racer: Racer){
        self.techCardID = 0
        self.racer = racer
        self.bike = nil
        self.licenseExpr = ""
        self.licenseExpr = ""
        self.rejectionNote = ""
        self.approved = false        
    }
    
}
