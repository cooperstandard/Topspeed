//
//  DriverModel.swift
//  TopSpeed
//
//  Created by Cooper Standard on 5/2/22.
//

import Foundation
struct Racer: Codable, Hashable{
    
    var racerId: Int
    var name: String
    var hometown: String
    var phoneNumber: String
    var email: String
    var wins: Int
    var loses: Int
    
    static func == (lhs: Racer, rhs: Racer) -> Bool {
        return (lhs.racerId == rhs.racerId)
    }
    
    
    //var races: [Race]?
    /*
    init(racerId: Int, name: String, hometown: String? = nil, phoneNumber: String, email: String, wins: Int, loses: Int, races: [Race]? = nil) {
        self.racerId = racerId
        self.name = name
        self.hometown = hometown
        self.phoneNumber = phoneNumber
        self.email = email
        self.wins = wins
        self.loses = loses
        self.races = races
     
    
    
    
    }
*/
}
/*

init(racerId: Int, name: String, hometown: String? = nil, phoneNumber: String, email: String, wins: Int, loses: Int, races: [Race]? = nil) {
    self.racerId = racerId
    self.name = name
    self.hometown = hometown
    self.phoneNumber = phoneNumber
    self.email = email
    self.wins = wins
    self.loses = loses
    self.races = races

    
}
*/
 
/*

func callAPI(){
    guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1") else{
        return
    }


    let task = URLSession.shared.dataTask(with: url){
        data, response, error in
        
        if let data = data, let string = String(data: data, encoding: .utf8){
            print(string)
        }
    }

    task.resume()
}

callAPI()
 */

/*
func decodeAPI(){
    guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else{return}

    let task = URLSession.shared.dataTask(with: url){
        data, response, error in
        
        let decoder = JSONDecoder()

        if let data = data{
            do{
                let tasks = try decoder.decode([Post].self, from: data)
                tasks.forEach{ i in
                    print(i.title)
                }
            }catch{
                print(error)
            }
        }
    }
    task.resume()

}
decodeAPI()
*/
