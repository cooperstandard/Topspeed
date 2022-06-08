//
//  TechCheckModel.swift
//  TopSpeed
//
//  Created by Alex Tarpley on 6/7/22.
//

import Foundation

struct TechCheck: Codable{
    // A view that a organizer on the track can go into and check off tech cards on bikes. 
    var boolDetails: [String: Bool]
    var strDetails: [String : String]
    
    
    init(){
        self.boolDetails =  [:]
        self.strDetails = [:]
    }
}
    
