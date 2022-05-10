//
//  ResourceFetcher.swift
//  TopSpeed
//
//  Created by Cooper Standard on 5/9/22.
//

import Foundation

/*
 func fetch(url: URL) -> String {
    /*
    let url = URL(string: "143.198.139.47:5000/racer/1")
    let task = URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
      // your code here
    })

    task.resume()
    
    
    return ""
     */
    
    var datastring = "empty"
    let requestUrl = url
    // Create URL Request
    var request = URLRequest(url: requestUrl)
    // Specify HTTP Method to use
    request.httpMethod = "GET"
    // Send HTTP Request
    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
        
        // Check if Error took place
        if let error = error {
            print("Error took place \(error)")
            return
        }
        
        // Read HTTP Response Status code
        if let response = response as? HTTPURLResponse {
            print("Response HTTP Status code: \(response.statusCode)")
        }
        
        // Convert HTTP Response Data to a simple String
        if let data = data, let dataString = String(data: data, encoding: .utf8) {
            print("Response data string:\n \(dataString)")
            datastring = dataString
        }
        
        
    }
    task.resume()
    return datastring
}
*/

func callAPI() -> String{
    guard let url = URL(string: "swe.cooperstandard.org:5000/racer/1") else{
        return "invalid url"
    }
    
    var ret: String = "failed"

    let task = URLSession.shared.dataTask(with: url){
        data, response, error in
        
        if let data = data, let string = String(data: data, encoding: .utf8){
            print(string)
            ret = string
        }
    }

    task.resume()
    return ret
    
}


