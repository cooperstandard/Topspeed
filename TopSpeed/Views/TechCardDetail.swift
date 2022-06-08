//
//  TechCardDetail.swift
//  TopSpeed
//
//  Created by Cooper Standard on 5/2/22.
//

// Allows you to fill out some information for your tech card and pick a bike and a class

import SwiftUI

struct TechCardDetail: View {
    
    @Binding var user: User
    @State var tech: TechCard
    // @State private var showAddScreen = false
    @State private var licenseNum = ""
    @State private var licenseExpr = ""
    @State private var tourney = ""
    private let classes = ["Top Fuel",
                           "Top Fuel Twin",
                           "Pro Comp",
                           "Pro Street",
                           "Real Street",
                           "Top Gas",
                           "Crazy 8s",
                           "St. Fighter",
                           "Super Comp",
                           "Pro ET",
                           "Street ET",
                           "Grudge"]
    
    private let tourneys = [
        "Maryland, June 22",
        "Florida, July 5",
        "Oakland, July 19",
        "New Mexico,  August 3",
   
    ]

    func fillCard(user: User, tech: TechCard){
    // takes in a user profile and an empty tech card and fills it
    
        
    }
    
    var body: some View {
        
        ScrollView{
            VStack{
                HStack{
                    Text("Pick a tournamnet ")
                    Picker("No Tourneys", selection: $tourney){
                        ForEach(0..<tourneys.count){index in
                            Text(tourneys[index])
                        }//.pickerStyle(.wheel)
                    }.padding().background(Color.gray.opacity(0.2).cornerRadius(10))
                        .foregroundColor(.black)
                }
            }
        VStack{
            HStack{
                Text("Racer Details").font(.title3)
                Spacer()
            }
            VStack{
            // set up if else to take components if they arent in a profile
            Text(user.racer!.racerName!)
            Text(user.racer!.racerAddress!)
            }.padding()
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
        
            HStack{
                Text("Pick a Class")
                Picker("Pick a class:", selection: $tech.raceClass){
                    ForEach(0..<classes.count){index in
                        Text(classes[index])
                    }//.pickerStyle(.wheel)
                }.padding().background(Color.gray.opacity(0.2).cornerRadius(10))
                    .foregroundColor(.black)
            }
        HStack{
            // make a popUp list
            Text("Select A Bike")
            Picker("Select A Bike", selection: $tech.bike){
                    ForEach(user.bikes!, id: \.id) { bike in
                        Text(" \(bike.bikeManufacturer) \t|\t Number \(bike.id)")
                    }
                }
            .padding()
            .background(Color.gray.opacity(0.2).cornerRadius(10))
            .foregroundColor(.black)

        }
                .pickerStyle(.menu).padding()
        //.pickerStyle(.wheel)
            
        // Add section that displays the details of the picked bike below the picker
            /* eng amek
             year
             No. Cyl
             Cu CM
             Body Make
             BodyType
             WheelBase
             Engine Num
             Shipping WT
             min WT
             */
        VStack{
            HStack{
                //Text("Bike Details:").font(.title3)
                Spacer()
            }.padding(.horizontal)
          
            
            
        }.padding()
        Spacer()
        Button(action: {
            // Action to upload tech card to a tournament
                
                
            }, label: {
                Text("Upload".uppercased())
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green.cornerRadius(10))
                    .foregroundColor(.white)
                    .font(.headline)
                
            }
            ).padding()
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

