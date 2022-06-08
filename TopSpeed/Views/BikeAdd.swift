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
    @State var bikeNum: Int = 0
    @State var bikeManu: String = ""
    @State var bikeModel: String = ""
    @State var bikeYear: Int = 0
    @State var bodyYear: Int = 0
    @State var bodyMake: String = ""
    @State var wheelBase: String = ""
    @State var engMake: String = ""
    @State var engYear: String = ""
    @State var cubicCM: String = ""
    @State var fuelType: String = ""
    @State var shippingWT: String = ""
    @State var numCylinders: String = ""
    

    var body: some View {
    
        ScrollView{
            VStack{
                Text("General").font(.title3)
                HStack{
                    Text("Bike Number ")
                        .padding()
                        .font(.subheadline)
                    TextField("Bike Number: ", value: $bikeNum, formatter: NumberFormatter())
                        .padding()
                        .background(Color.gray.opacity(0.2).cornerRadius(10))
                }
                HStack{
                    Text("Bike Manufacturer  ")
                        .padding()
                        .font(.subheadline)
                    TextField("Honda ", text: $bikeManu)
                        .padding()
                        .background(Color.gray.opacity(0.2).cornerRadius(10))
                }
                HStack{
                    Text("Bike Model:  ").padding().font(.subheadline)
                    TextField("Honda", text: $bikeModel)
                        .padding()
                        .background(Color.gray.opacity(0.2).cornerRadius(10))
                }
                HStack{
                    Text("Bike Year ").padding().font(.subheadline)
                    TextField( "Year", value: $bikeYear, formatter: NumberFormatter())
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
                    TextField("Honda ", text: $bodyMake)
                        .padding()
                        .background(Color.gray.opacity(0.2).cornerRadius(10))
                }
                HStack{
                    Text("Body Year:")
                        .padding()
                        .font(.subheadline)
                    TextField("2000 ", value: $bodyYear, formatter: NumberFormatter())
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
                //addPostBike(user: user,bike: bike)
                saveDetails()
                
            }, label: {
                Text("Save".uppercased())
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue.cornerRadius(10))
                    .foregroundColor(.white)
                    .font(.headline)
                
            }
            ).padding()
            Button(action: {
                saveDetails()
                addPostBike(user: user,bike: bike)

            }, label: {
                Text("Send".uppercased())
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue.cornerRadius(10))
                    .foregroundColor(.white)
                    .font(.headline)
                
            }
            ).padding()
            //used for speeding up testing, remove from final 
            Button("Fill Bike", action:{
                fillBike()
               
            })
        
        //.navigationTitle("Add New Bike")
        
           
        }
        }
        
    

    func fillBike(){
        
        bikeNum = 23
        bodyYear = 2020
        bodyMake = "Kawa"
        bikeManu = "Manufacturer 4"
        bikeModel = "Fast"
        bikeYear = 2022
        engMake = "Honda"
        engYear = "2014"
        cubicCM = "50.8"
        wheelBase =  "67.98"
        fuelType = "Nitro"
        shippingWT = "500.25"
        numCylinders = "4"
        
    

    }
    func saveDetails(){
        //bike.racerID = user.racer!.racerID
        bike.bodyMake = bodyMake
        bike.bodyYear = bodyYear
        bike.bikeNum = bikeNum
        bike.bikeYear = bikeYear
        bike.bikeModel = bikeModel
        bike.bikeManufacturer = bikeManu
        bike.details["cubicCM"] = cubicCM
        bike.details.updateValue(engMake, forKey: "engMake")
        bike.details.updateValue(engYear, forKey: "engYear")
        bike.details.updateValue(wheelBase, forKey: "wheelBase")
        bike.details.updateValue(fuelType, forKey: "fuelType")
        bike.details.updateValue(shippingWT, forKey: "shippingWT")
        bike.details.updateValue(numCylinders, forKey: "numClyinders")
        print(bike)
    }
    func addPostBike (user: User, bike: Bike){
        // saves the bike and posts it as a user
        // do we need to append it to or will post bike and then get bike
        saveDetails()
        print("new bike")
        print(bike)
        //print("existing bike")
        //print(user.bikes!.first)
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
    
    @State static var bikeEx = Bike(racerID: 1)
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


