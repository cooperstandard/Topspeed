//
//  BikeDetail.swift
//  TopSpeed
//
//  Created by Alex Tarpley on 6/1/22.
//

import SwiftUI

struct BikeDetail: View {
    @Binding var user: User
    var bike: Bike
    /*
     Optional([TopSpeed.Bike(id: 1, bikeNum: 1, bikeManufacturer: "Honda", bikeModel: "Model 1", bikeYear: 2014, bodyMake: "Honda", bodyYear: 2014, details: ["engMake": "Honda", "engYear": "2014", "cubicCM": "50.8", "wheelBase": "67.98", "fuelType": "Nitro", "shippingWT": "500.25", "numCylinders": "4"])])
     */
  
    var body: some View {
        ScrollView{
        VStack{
            Image("blankProfile").resizable().scaledToFit()
            Section("Bike Details"){
                VStack{// Engine Stuff
                     Text("BikeNum:     \(bike.bikeNum)").font(.title2)
                         .fontWeight(.medium)
                     Text("Bike Manufacturure:   \(bike.bikeManufacturer) ")
                                     .padding()
                     Text("Bike Year:  \(bike.bikeYear)").padding()
        }.background(Color.gray.opacity(0.2).cornerRadius(10))
        }
    Section("Engine Details"){
        VStack{
             Text("EngMake:     \(bike.details["engMake"]!) ")
                 .padding(.horizontal)
             Text("EngYear:     \(bike.details["engYear"]!) ")
                 .padding(.horizontal)
         
            Text("NumCylinders:  \(bike.details["numCylinders"]!) ")
                 .padding()
            Text("cubicCM:  \(bike.details["cubicCM"]!)")
                 .padding()
            Text("FuelType: \(bike.details["fuelType"]!) ")
                 .padding()
                 
            }
         }.padding()
         }.background(Color.gray.opacity(0.2).cornerRadius(10))
            
        Section("Body Details"){
         VStack{ //body Stuff
            
             Text("bodyMake:    \(bike.bodyMake) ")
                 .padding()
             Text("bodyYear:    \(bike.bodyYear) ")
                 .padding()
         
             Text("Shipping Weight: \(bike.details["shippingWT"]!) ")
                 .padding()
             Text("WheelBase:  \(bike.details["wheelBase"]!) ")
                 .padding()
            
         }.padding()
            }.background(Color.gray.opacity(0.2).cornerRadius(10))
        
         
        .navigationTitle("Racer Name's  \(bike.id)")
                .navigationBarTitleDisplayMode(.inline)

            }
        }
     }
 


struct BikeDetail_Previews: PreviewProvider {
    @State static var user = User(email: "test_", pass: "password")
    static var bikeEx = Bike(id: 1,racerID: 1, bikeNum: 1, bikeManufacturer: "Honda", bikeModel: "Model 1", bikeYear: 2014, bodyMake: "Honda", bodyYear: 2014, details: ["engMake": "Honda", "engYear": "2014", "cubicCM": "50.8", "wheelBase": "67.98", "fuelType": "Nitro", "shippingWT": "500.25", "numCylinders": "4"])
    static var previews: some View {
        BikeDetail(user: $user, bike: bikeEx)
    }
}

