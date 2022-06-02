//
//  Handler.swift
//  TopSpeed
//
//  Created by Cooper Standard on 5/25/22.
//
// This Class contains static functions for doing api calls

import Foundation



class Handler {
    
    static func getAll(user: User) {
        getRacer(user: user)
        getMessages(user: user)
        getBikes(user: user)
        
        
    }
    
    
    static func signIn(email: String, pass: String, user: User) {
        
        // declare the parameter as a dictionary that contains string as key and value combination. considering inputs are valid
        
        let parameters: [String: Any] = ["email": email, "password": pass]
        
        // create the url with URL
        let url = URL(string: "https://swe.cooperstandard.org:8080/login")! // change server url accordingly
        
        // create the session object
        let session = URLSession.shared
        
        // now create the URLRequest object using the url object
        var request = URLRequest(url: url)
        request.httpMethod = "POST" //set http method as POST
        
        // add headers for the request
        request.addValue("application/json", forHTTPHeaderField: "Content-Type") // change as per server requirements
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        do {
            // convert parameters to Data and assign dictionary to httpBody of request
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
            return
        }
        
        // create dataTask using the session object to send data to the server
        let task = session.dataTask(with: request) { data, response, error in
            
            if let error = error {
                print("Post Request Error: \(error.localizedDescription)")
                return
            }
            
            // ensure there is valid response code returned from this HTTP response
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode)
            else {
                print("Invalid Response received from the server")
                return
            }
            
            // ensure there is data returned
            guard let responseData = data else {
                print("nil Data received from the server")
                return
            }
            
            do {
                if let jsonResponse = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers) as? [String: Any] {
                    
                    user.token = "" + String(describing: jsonResponse["access_token"]).dropFirst(9).dropLast(1)
                    //print(user.token)
                    user.racer =  Racer(racerID: jsonResponse["racerID"] as! Int)
                    print("signin successful")
                    getAll(user: user)
                    
                    // handle json response
                } else {
                    print("data maybe corrupted or in wrong format")
                    throw URLError(.badServerResponse)
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }
        // perform the task
        task.resume()
    }
   
    
    static func getRacer(user: User) {
        guard let url = URL(string: "https://swe.cooperstandard.org:8080/racer/\(user.racer!.racerID)") else {
            print("Your API end point is Invalid")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET" //set http method as POST
        
        // add headers for the request
        request.addValue("application/json", forHTTPHeaderField: "Content-Type") // change as per server requirements
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("Bearer \(user.token)", forHTTPHeaderField: "Authorization")

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            if let data = data {
                if let response = try? JSONDecoder().decode(Racer.self, from: data) {
                    user.racer = response
                    print("get racer request succeeded")
                    return
                }
            }
        }.resume()
        
    }
    
    
    static func getMessages(user: User) {
        let session = URLSession.shared
        guard let url = URL(string: "https://swe.cooperstandard.org:8080/message") else {
            print("Your API end point is Invalid")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET" //set http method as needed
        
        // add headers for the request
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("Bearer " + user.token, forHTTPHeaderField: "Authorization")
        
        // create dataTask using the session object to send data to the server
        let task = session.dataTask(with: request) { data, response, error in
            
            if let error = error {
                print("Request Error: \(error.localizedDescription)")
                return
            }
            
            // ensure there is valid response code returned from this HTTP response
            let httpResponse = response as! HTTPURLResponse
            
            if !(200...299).contains(httpResponse.statusCode) {
                print(httpResponse.statusCode)
            }
            
            
            // ensure there is data returned
            guard let responseData = data else {
                print("nil Data received from the server")
                return
            }
            
            do {
                if let jsonResponse = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers) as? [String: Any] {
                    //This is a terrible way to do this. I could not find a better way.
                    //print(jsonResponse["messages"] ?? "No messages in server response")
                    if let array = jsonResponse["messages"] as? NSArray {
                        for obj in array {
                            if let dict = obj as? NSDictionary {
                                user.messages.append(Message.init(id: dict.value(forKey: "messageID") as! Int, title: dict.value(forKey: "title") as! String, body: dict.value(forKey: "body") as! String, timeSent: dict.value(forKey: "timeSent") as? String))
                            }
                        }
                    } else {
                        print("json response contained no messages")
                        user.messages[0] = Message(id: 0, title: "no messages", body: "You have no messages yet, refresh and check again later.", timeSent: Date.now.ISO8601Format())
                    }
                    
                    //print(user.messages)
                    print("messages successfully retrieved")

                } else {
                    print("data maybe corrupted or in wrong format")
                    
                    print(String(data: responseData, encoding: String.Encoding.utf8)!)
                    throw URLError(.badServerResponse)
                    
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }
        // perform the task
        task.resume()
        
    }
    
    
    static func updateRacer() {
        
    }
    
    
    static func getBikes(user: User) {
        let session = URLSession.shared
        guard let url = URL(string: "https://swe.cooperstandard.org:8080/racer/\(user.racer!.racerID)/bikes") else {
            print("Your API end point is Invalid")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET" //set http method as needed
        
        // add headers for the request
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("Bearer " + user.token, forHTTPHeaderField: "Authorization")
        
        // create dataTask using the session object to send data to the server
        let task = session.dataTask(with: request) { data, response, error in
            
            if let error = error {
                print("Request Error: \(error.localizedDescription)")
                return
            }
            
            // ensure there is valid response code returned from this HTTP response
            let httpResponse = response as! HTTPURLResponse
            
            if !(200...299).contains(httpResponse.statusCode) {
                print(httpResponse.statusCode)
            }
            
            
            // ensure there is data returned
            guard let responseData = data else {
                print("nil Data received from the server")
                return
            }
            
            do {
                if let jsonResponse = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers) as? [String: Any] {
                    //This is a terrible way to do this. I could not find a better way.
                    //print(jsonResponse["messages"] ?? "No messages in server response")
                    //print(jsonResponse)
                    user.bikes = []
                    if let array = jsonResponse["bikes"] as? NSArray {
                        for obj in array {
                            if var dict = obj as? NSDictionary as? Dictionary<String,Any> {
                                user.bikes!.append(Bike(id: dict.removeValue(forKey: "bikeID") as! Int, racerID: jsonResponse["racerID"] as! Int, bikeNum: dict.removeValue(forKey: "bikeNum") as! Int, bikeManufacturer: dict.removeValue(forKey: "bikeManufacturer") as! String , bikeModel: dict.removeValue(forKey: "bikeModel") as! String, bikeYear: dict.removeValue(forKey: "bikeYear") as! Int, bodyMake: dict.removeValue(forKey: "bodyMake") as! String, bodyYear: dict.removeValue(forKey: "bodyYear") as! Int, details: [:]))
                                for key in dict.keys {
                                    
                                    user.bikes![user.bikes!.count - 1].details[key] = "\(dict[key]!)"
                                }
                                
                                
                                
                            }
                        }
                        //print(user.bikes)
                    } else {
                        print("json response contained no bikes")
                        
                    }
                    
                    
                    print("bikes successfully retrieved")
                     

                } else {
                    print("data maybe corrupted or in wrong format")
                    
                    print(String(data: responseData, encoding: String.Encoding.utf8)!)
                    throw URLError(.badServerResponse)
                    
                }
                     
            } catch let error {
                print(error.localizedDescription)
            }
        }
        // perform the task
        task.resume()
        
    }
    
    
    static func postBike(user: User, bike: Bike) {
        // declare the parameter as a dictionary that contains string as key and value combination. considering inputs are valid
        //print("racer id \(user.racer?.racerID)")
        var parameters: [String: Any] = ["bikeManufacturer" : bike.bikeManufacturer,
                                         "bikeModel" : bike.bikeModel,
                                         "bikeNum" : bike.bikeNum,
                                         "bikeYear" : bike.bikeYear,
                                         "bodyMake" : bike.bodyMake,
                                         "bodyYear" : bike.bodyYear,
                                         "racerID" : user.racer!.racerID]
        
        for key in bike.details.keys {
            parameters[key] = bike.details[key]
            
        }
        //print(parameters)
        
        // create the url with URL
        let url = URL(string: "https://swe.cooperstandard.org:8080/bike")! // change server url accordingly
        
        // create the session object
        let session = URLSession.shared
        
        // now create the URLRequest object using the url object
        var request = URLRequest(url: url)
        request.httpMethod = "POST" //set http method as POST
        
        // add headers for the request
        request.addValue("application/json", forHTTPHeaderField: "Content-Type") // change as per server requirements
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("Bearer \(user.token)", forHTTPHeaderField: "Authorization")
        
        do {
            // convert parameters to Data and assign dictionary to httpBody of request
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
            return
        }
        
        // create dataTask using the session object to send data to the server
        let task = session.dataTask(with: request) { data, response, error in
            
            if let error = error {
                print("Post Request Error: \(error.localizedDescription)")
                return
            }
            
            // ensure there is valid response code returned from this HTTP response
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode)
            else {
                print("Invalid Response received from the server")
                return
            }
            
            // ensure there is data returned
            guard let responseData = data else {
                print("nil Data received from the server")
                return
            }
            
            do {
            // create json object from data or use JSONDecoder to convert to Model stuct
                if let jsonResponse = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers) as? [String: Any] {
                    if jsonResponse["bikeID"] != nil {
                        print("post bike succeeded. New bike has id \(jsonResponse["bikeID"] as! Int). Refreshing bikes")
                    } else {
                        print("bike post failed")
                    }
                    Handler.getBikes(user: user)
                    // handle json response
                    
                } else {
                    print("data maybe corrupted or in wrong format")
                    throw URLError(.badServerResponse)
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }
        // perform the task
        task.resume()
        
    }
    
    
    static func register(email: String, pass: String, name: String) {
        
        // declare the parameter as a dictionary that contains string as key and value combination. considering inputs are valid
        
        let parameters: [String: Any] = ["email": email, "password": pass, "name" : name, "accountType" : "racer"]
        
        // create the url with URL
        let url = URL(string: "https://swe.cooperstandard.org:8080/register")! // change server url accordingly
        
        // create the session object
        let session = URLSession.shared
        
        // now create the URLRequest object using the url object
        var request = URLRequest(url: url)
        request.httpMethod = "POST" //set http method as POST
        
        // add headers for the request
        request.addValue("application/json", forHTTPHeaderField: "Content-Type") // change as per server requirements
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        do {
            // convert parameters to Data and assign dictionary to httpBody of request
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
            return
        }
        
        // create dataTask using the session object to send data to the server
        let task = session.dataTask(with: request) { data, response, error in
            
            if let error = error {
                print("Post Request Error: \(error.localizedDescription)")
                return
            }
            
            // ensure there is valid response code returned from this HTTP response
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode)
            else {
                print("Invalid Response received from the server")
                return
            }
            
            // ensure there is data returned
            guard let responseData = data else {
                print("nil Data received from the server")
                return
            }
            
            do {
            // create json object from data or use JSONDecoder to convert to Model stuct
                if let jsonResponse = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers) as? [String: Any] {
                    print(jsonResponse)
                    // handle json response
                } else {
                    print("data maybe corrupted or in wrong format")
                    throw URLError(.badServerResponse)
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }
        // perform the task
        task.resume()
    }
    
    

    
}
