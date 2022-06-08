//
//  TechCheckView.swift
//  TopSpeed
//
//  Created by Alex Tarpley on 6/8/22.
//
// Racer organizers can go into this section when reviewing a bike and
// check off boxes or write commments as seen on the second half of the tech card
// still need submission and bike interaction functionality
// Out of order because of function to print all keys in the dictionary

//can merge the lists and make a function to show them in the correct order

import SwiftUI

struct TechCheckView: View {
    @Binding var user: User
    @State var techCheck: TechCheck
    
        
    
    private var techBoolKeys: [String] {
        return techCheck.boolDetails.keys.map{String($0)}
    }
    private var techStringKeys: [String] {
        return techCheck.strDetails.keys.map{String($0)}
    }


    private func bindingBool(for key: String) -> Binding<Bool> {
           return Binding(get: {
               return self.techCheck.boolDetails[key] ?? false
           }, set: {
               self.techCheck.boolDetails[key] = $0
           })
       }
    private func bindingString(for key: String) -> Binding<String> {
           return Binding(get: {
               return self.techCheck.strDetails[key] ?? ""
           }, set: {_ in
               self.techCheck.strDetails[key] = ""
           })
       }
    
    
    var body: some View {
        Text("Tech check review").font(.title).bold()
        Form{
            Section{
                ForEach(techExKeys, id: \.self){
                    key in
                    Toggle(isOn: bindingEx(for: key)){
                        Text(key)
                    }
                }
            }
            Section{
                ForEach(techBoolKeys, id: \.self){
                    key in
                    Toggle(isOn: bindingBool(for: key)){
                        Text(key)
                    }
                }
            }
            Section{
                ForEach(techStringKeys, id: \.self){
                    key in
                    HStack{
                        Text("\(key): ")
                        TextField("Enter here",text: bindingString(for: key))
                    }
                }
            }
        }
            
        Button(action: {
            
            
            
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
    @State private var techEx: [String:Bool] = [
        "Cooling System":false,
        "Engine":false,
        "Exhaust ":false,
        "Flash Sheild ":false,
        "Fuel System ":false,
        "Racing Gasoline ":false,
        "Liquid Overflow ":false,
        "Methanol ":false,
        "Nitrous System ":false,
        "Super charger-burst panels ":false,
        "Super charger restraint devices ":false,
        "Throttle":false,
        "Vent Tubes, Breathers":false,
        "Valve Cover Restraint ":false,
        "Lower Containment":false,
        "Anti-Blowback Device":false,
        "Axle-Retention Device":false,
        ]
    
    private var techExKeys: [String] {
        return techEx.keys.map{String($0)}
    }
    private func bindingEx(for key: String) -> Binding<Bool> {
           return Binding(get: {
               return self.techCheck.boolDetails[key] ?? false
           }, set: {
               self.techCheck.boolDetails[key] = $0
           })
       }
}

struct TechCheckView_Previews: PreviewProvider {
@State static var user = User(email: "test_", pass: "password")
    @State static var techCh = TechCheck()
    static var previews: some View {
        TechCheckView(user: $user, techCheck: techCh)
    }
}
