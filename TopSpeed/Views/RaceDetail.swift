//
//  RaceDetail.swift
//  TopSpeed
//
//  Created by Cooper Standard on 5/2/22.
//

// Show the stats for an individual race

import SwiftUI

struct RaceDetail: View {
    var race : Race
    var body: some View {
        VStack{
            HStack{
                Text("Moto ID: ")
                Text("\(race.motoID)")
                
            }
            if (race.startTime == nil) {
                Text("Moto still being scheduled, please check back later")
            } else {
                HStack{
                    Text("Start Time: ")
                    Text(race.startTime!)
                    
                }
            }
            if (race.opponentID == nil) {
                Text("opponent not assinged yet")
            } else {
                HStack{
                    Text("Opponent id: ")
                    Text("\(race.opponentID!)")
                    
                }
            }
            
            Spacer()
            Text("Moto Details")
                .font(.title2)
            List {
                ForEach(race.details.sorted(by: >), id: \.key) { key, value in
                    if value != "<null>"{
                        Section(header: Text(key)) {
                                Text(value)
                            }
                    }
                                                
                }
            }
        }
        
    }
}

struct RaceDetail_Previews: PreviewProvider {
    static var race = Race(racerID: 1, heatID: 12, motoID: 14, opponentID: 3, startTime: "12:00", details: [:])
    
    static var previews: some View {
        RaceDetail(race: race)
    }
}
