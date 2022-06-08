//
//  MessageDetailView.swift
//  TopSpeed
//
//  Created by Alex Tarpley on 6/8/22.
//

import SwiftUI

struct MessageDetailView: View {
    @Binding var user: User
    @State var message: Message
    var body: some View {
        VStack{
            VStack{
                HStack{
                    Text("\(message.title)").font(.headline)
                    Spacer()
                }.padding(.horizontal)
                        
                HStack{
                    Text("\(message.timeSent!)").font(.subheadline)
                    Spacer()
                }.padding(.horizontal)
            }
            Text("\(message.body)").padding()
        }
        Spacer()
    }

}

struct MessageDetailView_Previews: PreviewProvider {
    @State static var user = User(email: "test_", pass: "password")
@State static var msg = Message(id: 11, title: "Test Message", body: "This is a test message", timeSent: "3:33 March 3, 2333")
    static var previews: some View {
        MessageDetailView(user: $user, message: msg)
    }
}
