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
    // @State private var showAddScreen = false
    @State private var licenseNum = ""
    @State private var licenseExpr = ""
    
    func fillCard(user: User, tech: TechCard){
    // takes in a user profile and an empty tech card and fills it
    
        
    }
    
    var body: some View {
        
        ScrollView{
        VStack{
            HStack{
                Text("Racer Details").font(.title3)
                Spacer()
            }
            VStack{
            // set up if else to take components if they arent in a profile
            Text(user.racer!.racerName!)
            Text(user.racer!.racerAddress!)
            }.padding().background(Color.gray.opacity(0.2).cornerRadius(10))
            VStack{
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
            //.padding().background(Color.gray.opacity(0.2).cornerRadius(10)).padding(.horizontal)
        }.padding()
        
    
        VStack{
            // make a popUp list
            Picker("Select A Bike", selection: $tech.bike){
                    ForEach(user.bikes!, id: \.id) { bike in
                        Text("\(bike.bikeManufacturer) \t|\t Number \(bike.id)")
                    }
                }
    
        }.pickerStyle(.wheel).padding()
        
        VStack{
            HStack{
                Text("Bike Details:").font(.title3)
                Spacer()
            }.padding(.horizontal)
          
            
            
        }.padding()
        Spacer()
        }
    }
}
   
   
     //   .sheet(isPresented: $showAddScreen, content: BikeList)
    func saveLicense(techC: TechCard, licNum: String, licExp: String){
        // techC.licenseNum = licNum
        //techC.licenseExpr = licExp
    }


struct TechCardDetail_Previews: PreviewProvider {
    @State static var user = User(email: "test_", pass: "password")
    @State static var techCard = TechCard()
    static var previews: some View {
        TechCardDetail(user:$user, tech: techCard)
    }
}

