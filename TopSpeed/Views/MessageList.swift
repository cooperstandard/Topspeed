//
//  MessageList.swift
//  TopSpeed
//
//  Created by Cooper Standard on 5/31/22.
//

import SwiftUI

struct MessageList: View {
    @Binding var user: User
    var body: some View {
        
        if(user.messages.last?.id == 0) {
            Text("No messages found\nplease refresh or check back later")
                .font(.title)
                .onAppear(perform: {print(user.messages)})
            
            
        } else {
            
            List(user.messages, id: \.id) { message in
                NavigationLink(message.title, destination: MessageDetailView(user: $user, message: message))
                
            }
            
            
        }
         
        
    }
}

struct MessageList_Previews: PreviewProvider {
    @State static var user = User(email: "test_", pass: "password")
    static var previews: some View {
        MessageList(user: $user)
    }
}
