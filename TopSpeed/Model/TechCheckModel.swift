//
//  TechCheckModel.swift
//  TopSpeed
//
//  Created by Alex Tarpley on 6/7/22.
//

import Foundation

struct TechCheck: Codable{
    
    var boolDetails: [String: Bool]
    var strDetails: [String : String]
    
    init(){
        self.boolDetails =  [:]
        self.strDetails = [:]
    }
}
    
