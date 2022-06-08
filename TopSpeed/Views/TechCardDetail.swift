//
//  TechCardDetail.swift
//  TopSpeed
//
//  Created by Cooper Standard on 5/2/22.
//

// This should show all the details of the tech card

import SwiftUI

struct TechCardDetail: View {
    
    @Binding var user: User
    @State var tech: TechCard
    @State private var showAddScreen = false
    @State private var licenseNum = ""
    @State private var licenseExpr = ""
    
    func fillCard(user: User, tech: TechCard){
    // takes in a user profile and an empty tech card and fills it
    
        
    }
    var body: some View {
        

        VStack{
            HStack{
                Text("Racer Details").font(.title3)
                Spacer()
            }
            // set up if else to take components if they arent in a profile
            Text(user.racer!.racerName!)
            Text(user.racer!.racerAddress!).padding(.bottom)
            HStack{
            Text("Enter license information:")
            Spacer()
            }
            HStack{
                Text("License #:")
                TextField("Enter Text Here", text: $licenseNum)
                    .padding()
                    .background(Color.gray.opacity(0.2).cornerRadius(10))
                
            }
                //tech.licenseNum = licenseNum
            HStack{
                Text("License Exp:")
                TextField("Enter Text Here", text: $licenseExpr)
                    .padding()
                    .background(Color.gray.opacity(0.2).cornerRadius(10))
            }//tech.licenseExpr = licenseExpr
        }.padding()
        VStack{
            // make a popUp list
            Text("Select a bike:")
            Picker("Bike", selection: $tech.bike){
                    List(user.bikes!, id: \.id) {bike in
                        Text("\(bike.bikeManufacturer):Number  \(bike.bikeNum), Year \(bike.bikeYear) ")
                    }
                    
                }
    
        }.pickerStyle(.wheel)
            .padding(.bottom)
        VStack{
            Text("Bike Details:")
            
        }
        Spacer()
        }
    }
   
   
     //   .sheet(isPresented: $showAddScreen, content: BikeList)
    func saveLicense(techC: TechCard, licNum: String, licExp: String){
        // techC.licenseNum = licNum
        //techC.licenseExpr = licExp
    }


struct TechCardDetail_Previews: PreviewProvider {
    @State static var user = User(email: "test_", pass: "password")
    @State static var techCard = TechCard(racer: user.racer!)
    static var previews: some View {
        TechCardDetail(user:$user, tech: techCard)
    }
}

