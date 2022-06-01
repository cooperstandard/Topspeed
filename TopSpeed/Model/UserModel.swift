import Foundation


class User: Codable {
    var id : String
    var token : String
    var time : Date
    var racer : Racer?
    var bikes : [Bike]?
    var cards : [TechCard]?
    var past : [Race]?
    var next : Race?
    var future : [Race]?
    var messages : [Message] = [Message(id: 0, title: "empty", body: "empty", timeSent: "never")]
    
    
    init(id: String) {
        self.id = id;
        token = ""
        time = Date.now;
        
    }
    
    
    init(email: String, pass: String) {
        id = email
        token = "no token"
        time = Date.now
        
        Handler.signIn(email: email, pass: pass, user: self)
        //this is just to make the compiler happy, remove when the properties are actually set
        
        
    }
    
    func update(email: String, pass: String) {
        id = email
        token = "no token"
        time = Date.now
        
        Handler.signIn(email: email, pass: pass, user: self)
        //this is just to make the compiler happy, remove when the properties are actually set
        
        
    }
    


}
