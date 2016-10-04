//
//  NetworkManager.swift
//  i-Partner
//
//  Created by Мануэль on 04.10.16.
//  Copyright © 2016 AuroraInterplay. All rights reserved.
//

import Foundation

class NetworkManaged
{
    let session = URLSession.shared
    
    var sessionID: String?
    
    var textToPost: String?
    
    func requestWithMethod(_ method: String) {
        
        var request = URLRequest(url: URL(string: Network.url)!)
        
        var postString = "a=\(method)"
        
        request.httpMethod = "POST"
        
        request.addValue("\(Network.token)", forHTTPHeaderField: "token")
        
        switch method {
            
        case Network.Methods.addEntry:
            
            postString += "&session=\(sessionID!)"
            postString += "&body=\(textToPost!)"
            
        case Network.Methods.getEntries:
            postString += "&session=\(sessionID!)"
            
        default:
            break
        }
        
        request.httpBody = postString.data(using: .utf8)
        
        //Data fetching and json serialization
        
        let task = session.dataTask(with: request) {
            data, response, error in
            
            guard data != nil else { print(error); return }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                
                print("\(response)")
            }
            
            do
            {
                let jsonData = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String: AnyObject]
                
                if let responseData = jsonData["data"] as? [String: AnyObject], let responseSesionID = responseData["session"] as? String
                {
                    self.sessionID = responseSesionID
                }
                
                if let responseData = jsonData["data"] as? [[String: AnyObject]] {
                    
                    print("watewa")
                    
                }
                
            }
            catch let error
            {
                print(error)
            }
        }
        task.resume()
    }
    
}
