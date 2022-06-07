//
//  BikeAdd.swift
//  TopSpeed
//
//  Created by Alex Tarpley on 6/6/22.
//

import SwiftUI

struct BikeAdd: View {
    @Binding var user: User
    @State var bike: Bike
    @State var wheelBase: String = ""
    @State var engMake: String = ""
    @State var engYear: String = ""
    @State var cubicCM: String = ""
    @State var fuelType: String = ""
    @State var shippingWT: String = ""
    @State var numCylinders: String = ""
    

    var body: some View {
    
        NavigationView{
        ScrollView{
            VStack{
                Text("General").font(.title3)
                HStack{
                    Text("Bike Number ")
                        .padding()
                        .font(.subheadline)
                    TextField("Bike Number: ", value: $bike.bikeNum, formatter: NumberFormatter())
                        .padding()
                        .background(Color.gray.opacity(0.2).cornerRadius(10))
                }
                HStack{
                    Text("Bike Manufacturer  ")
                        .padding()
                        .font(.subheadline)
                    TextField("Honda ", text: $bike.bikeManufacturer )
                        .padding()
                        .background(Color.gray.opacity(0.2).cornerRadius(10))
                }
                HStack{
                    Text("Bike Model:  ").padding().font(.subheadline)
                    TextField("Honda", text: $bike.bikeModel)
                        .padding()
                        .background(Color.gray.opacity(0.2).cornerRadius(10))
                }
                HStack{
                    Text("Bike Year ").padding().font(.subheadline)
                    TextField( "Year", value: $bike.bikeYear, formatter: NumberFormatter())
                    // test out .onSubmit call
                        .padding()
                        .background(Color.gray.opacity(0.2).cornerRadius(10))
                }
            }.padding()
            Text("Body Details").font(.title3)
            VStack{
                
                
                HStack{
                    Text("Body Make: ")
                        .padding()
                        .font(.subheadline)
                    TextField("Honda ", text: $bike.bodyMake)
                        .padding()
                        .background(Color.gray.opacity(0.2).cornerRadius(10))
                }
                HStack{
                    Text("Body Year:")
                        .padding()
                        .font(.subheadline)
                    TextField("2000 ", value: $bike.bodyYear, formatter: NumberFormatter())
                        .padding()
                        .background(Color.gray.opacity(0.2).cornerRadius(10))
                }
                HStack{
                    Text("Wheel Base: ")
                        .padding()
                        .font(.subheadline)
                    TextField("type here", text: $wheelBase)
                        .padding()
                        .background(Color.gray.opacity(0.2).cornerRadius(10))
                }
                HStack{
                    Text("Shipping Weight:  ")
                        .padding()
                        .font(.subheadline)
                    TextField("in pounds", text: $shippingWT)
                        .padding()
                        .background(Color.gray.opacity(0.2).cornerRadius(10))
                }
            }.padding(.trailing).padding(.horizontal)
            
            VStack{
                Text("Engine Details").padding().font(.title3)
                HStack{
                    Text("Engine Make: ")
                        .padding()
                        .font(.subheadline)
                    TextField("Honda ", text: $engMake)//{
                       // .onChange(of: $engMake, perform: bike.details["engMake"] = engMake)
                //    }
                        .padding()
                        .background(Color.gray.opacity(0.2).cornerRadius(10))
            }
                HStack{
                    Text("Engine Year:  ")
                        .padding()
                        .font(.subheadline)
                    TextField("Enter Year ", text: $engYear)
                        .padding()
                        .background(Color.gray.opacity(0.2).cornerRadius(10))
                }
                HStack{
                    Text("Number of Cylinders:  ")
                        .padding()
                        .font(.subheadline)
                    TextField("Enter Number ", text: $numCylinders)
                        .padding()
                        .background(Color.gray.opacity(0.2).cornerRadius(10))
                }
                HStack{
                    Text("Cubic CM:  ")
                        .padding()
                        .font(.subheadline)
                    TextField("Cubic CM: ", text: $cubicCM)
                        .padding()
                        .background(Color.gray.opacity(0.2).cornerRadius(10))
                }
                HStack{
                    Text("Fuel Type:  ")
                        .padding()
                        .font(.subheadline)
                    TextField("Enter here", text: $fuelType)
                        .padding()
                        .background(Color.gray.opacity(0.2).cornerRadius(10))
                }
                
               
            }.padding(.horizontal)
            
            Button(action: {
                addPostBike(user: user,bike: bike)
                
                
            }, label: {
                Text("Save".uppercased())
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue.cornerRadius(10))
                    .foregroundColor(.white)
                    .font(.headline)
                
            }
            ).padding()
            
            Button("Fill Bike", action:{
                addBike()
                NavigationLink("BikeList", destination: BikeList(user: $user))
            })
        
        //.navigationTitle("Add New Bike")
        
           
        }
        }
        
    }

    func addBike(){
        bike.racerID = 1
        engMake = "Honda"
        engYear = "2014"
        cubicCM = "50.8"
        wheelBase =  "67.98"
        fuelType = "Nitro"
        shippingWT = "500.25"
        numCylinders = "4"
        bike.bodyYear = 2020
        bike.bodyMake = "Kawa"
        bike.bikeManufacturer = "Manufacturer 4"
        bike.bikeModel = "Fast"

    }
    func saveDetails(){
        bike.racerID = user.racer!.racerID
        bike.details["cubicCM"] = cubicCM
        bike.details.updateValue(engMake, forKey: "engMake")
        bike.details.updateValue(engYear, forKey: "engYear")
        bike.details.updateValue(wheelBase, forKey: "wheelBase")
        bike.details.updateValue(fuelType, forKey: "fuelType")
        bike.details.updateValue(shippingWT, forKey: "shippingWT")
        bike.details.updateValue(numCylinders, forKey: "numClyinders")
    }
    func addPostBike (user: User, bike: Bike){
        // saves the bike and posts it as a user
        // do we need to append it to or will post bike and then get bike
        saveDetails()
        print("new bike")
        print(bike)
        print("existing bike")
        print(user.bikes!.first)
        Handler.postBike(user: user, bike: bike)
    }
    /*
    init(){
        self.bike = Bike.init(racerID: user.racer!.racerID)
        self.engMake = ""
        self.engYear = ""
        self.cubicCM = ""
        self.wheelBase = ""
        self.fuelType = ""
        self.shippingWT = ""
        self.numCylinders = ""
        self.user = user

    }
     */
    
}
struct BikeAdd_Previews: PreviewProvider {
    @State static var user = User(email: "test_", pass: "password")
    
    @State static var bikeEx = Bike(racerID: 0)
    /*
    @State static var engMake = ""
    @State static var engYear = ""
    @State static var cubicCM = ""
    @State static var wheelBase = ""
    @State static var fuelType = ""
    @State static var shippingWT = ""
    @State static var numCylinders = ""
    */

    static var previews: some View {
        
        BikeAdd(user: $user, bike: bikeEx)
            
        
    }
}


