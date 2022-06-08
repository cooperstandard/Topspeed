//
//  MainMenu.swift
//  TopSpeed
//
//  Created by Cooper Standard on 5/2/22.
//

import SwiftUI

struct MainMenu: View {
    @State var id = 1;
    @Binding var user: User
   let racer1 = Racer(racerID: 1)
    /*
    let bikeEx = Bike(racerID: 1)
    let engMake = ""
    let engYear = ""
    let cubicCM = ""
    let wheelBase = ""
    let fuelType = ""
    let shippingWT = ""
    let  numCylinders = ""
    */
    
    
    var body: some View {
        
        
        NavigationView {
            //ScrollView{
            VStack{
                VStack{
                    HStack{
                        Text("Profile:").font(.title3).foregroundColor(.black)
                    Spacer()
                    }
                HStack{
                NavigationLink(destination: RacerDetailView(user: $user)) {
                    
                    Image("Boone")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                    VStack{
                    Text("Racer Name").foregroundColor(.black)
                    Text("12 - 4").foregroundColor(.black)//("/*\(user.racer!.wins!) -\(user.racer!.losses!)")
                        }
                    }
                }
                }   .padding()
                    .background(Color.gray.opacity(0.2).cornerRadius(10))
                .padding(.horizontal)
               
                
                //.onAppear(perform: loadData)
                
                HStack {
                    NavigationLink("Bikes", destination: BikeList(user: $user))
                        .frame(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.black)
                        .background(Color.blue.opacity(0.2).cornerRadius(10))
                        .padding()

                    NavigationLink("Races", destination: RaceList(user: $user))
                        .frame(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.black)
                        .background(Color.blue.opacity(0.2).cornerRadius(10))
                        .padding()

                }
                
                HStack { // add this link to a plus button in the toolbar of bikeslist
                    NavigationLink("Add Bike", destination: BikeAdd(user: $user, bike: Bike(racerID: 0)))// racer id gets set with post bike
                        .frame(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.black)
                        .background(Color.blue.opacity(0.2).cornerRadius(10))
                        .padding()

                        
                        
                    
                    NavigationLink("Tech Card", destination: TechCardDetail(user: $user, tech: TechCard()))
                        .frame(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.black)
                        .background(Color.blue.opacity(0.2).cornerRadius(10))
                        .padding()

                }
                
                HStack {
                    NavigationLink("Messages", destination: MessageList(user: $user))
                        .frame(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.black)
                        .background(Color.blue.opacity(0.2).cornerRadius(10))
                        .padding()

                        
                        
                    
                    NavigationLink("Current Race", destination: RaceDetail(race: user.next ?? Race(racerID: 0, heatID: 0, motoID: 0, opponentID: 12, startTime: "unknown", details: [:])))
                        .frame(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.black)
                        .background(Color.blue.opacity(0.2).cornerRadius(10))
                        .padding()
                    
                    NavigationLink("Tech Card Check", destination: TechCheckView(user: $user, techCheck: TechCheck()))
                    

                
                }
                //future features 
                NavigationLink("Tech Check", destination: TechCheckView(user: $user, techCheck: TechCheck()))
                    .frame(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.black)
                    .background(Color.blue.opacity(0.2).cornerRadius(10))
                    .padding()
                
                //for testing bikes
                HStack{
                    Button("Post Bike 1", action: {guard let bike = user.bikes?.first else {return};
                                                    Handler.postBike(user: user, bike: bike)})
                    
                    
                    Button("get bikes", action: {Handler.getBikes(user: user)})
                    
                    Button("print bikes", action: {guard let bikes = user.bikes else {return}
                                                    for bike in bikes {
                                                        print(bike)
                        
                                                    }})
                    
                
                }
                
                
            }
            //.navigationTitle("Main Menu")
            
            .navigationBarHidden(true)
            
//            .frame(
//                  minWidth: 0,
//                  maxWidth: .infinity,
//                  minHeight: 0,
//                  maxHeight: .infinity,
//                  alignment: .center
//            )
            //Spacer()
            //Spacer()
            //.ignoresSafeArea()
            
            

        }
        
        
    }
    
    /*
  
    func loadData() {
        guard let url = URL(string: "https://swe.cooperstandard.org:8080/racer/\(id)") else {
            print("Your API end point is Invalid")
            return
        }
        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            if let data = data {
                if let response = try? JSONDecoder().decode(Racer.self, from: data) {
                    DispatchQueue.main.async {
                        self.racer = response
                        print("request succeeded")
                    }
                    return
                }
            }
        }.resume()
    }
    */
}
        


struct MainMenu_Previews: PreviewProvider {
    @State static var user = User(email: "test_", pass: "password")
    
    static var previews: some View {
        MainMenu(user: $user)
            .previewInterfaceOrientation(.portrait)
    }
}
