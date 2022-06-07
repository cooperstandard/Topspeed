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
                NavigationLink(destination: RacerDetailView(user: $user)) {
                    Image("blankProfile")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        
                }
                //.onAppear(perform: loadData)
                
                HStack {
                    NavigationLink("Bikes", destination: BikeList(user: $user))
                        .frame(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.black)
                        .background(.red)
                        
                        
                    
                    NavigationLink("Races", destination: RaceList(races: []))
                        .frame(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.black)
                        .background(.red)
                }
                
                HStack {
                    NavigationLink("Add Bike", destination: BikeAdd(user: $user, bike: Bike(racerID: 0)))
                        .frame(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.black)
                        .background(.red)
                        
                        
                    
                    NavigationLink("Current Race", destination: RaceDetail())
                        .frame(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.black)
                        .background(.red)
                }
                
                HStack {
                    NavigationLink("Messages", destination: MessageList(user: $user))
                        .frame(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.black)
                        .background(.red)
                        
                        
                    
                    NavigationLink("Current Race", destination: RaceDetail())
                        .frame(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.black)
                        .background(.red)
                
                }
                
                //for testing bikes
                HStack{
                    Button("Post Bike 1", action: {guard let bike = user.bikes?.first else {return};
                                                    Handler.postBike(user: user, bike: bike)})
                    
                    
                    Button("get bikes", action: {Handler.getBikes(user: user)})
                    
                    Button("print bikes", action: {print(user.bikes)})
                    
                
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
