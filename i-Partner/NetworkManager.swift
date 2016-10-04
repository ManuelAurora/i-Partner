//
//  NetworkManager.swift
//  i-Partner
//
//  Created by Мануэль on 04.10.16.
//  Copyright © 2016 AuroraInterplay. All rights reserved.
//

import Foundation
import UIKit

class NetworkManager
{
    private let session = URLSession.shared
    
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var sessionID: String? {
        didSet
        {
            guard sessionID != nil else { return }
            
            self.requestWithMethod(Network.Methods.getEntries)
        }
    }
    
    var recordToPost: Record?
    
    func requestWithMethod(_ method: String) {
        
        var request = URLRequest(url: URL(string: Network.url)!)
        
        var postString = "a=\(method)"
        
        request.httpMethod = "POST"
        
        request.addValue("\(Network.token)", forHTTPHeaderField: "token")
        
        switch method {
            
        case Network.Methods.addEntry:
            
            postString += "&session=\(sessionID!)"
            postString += "&body=\((recordToPost!.text))"
            
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
                
                if let responseData = jsonData["data"] as? [String: AnyObject]
                {
                    if let responseSesionID = responseData["session"] as? String
                    {
                        self.sessionID = responseSesionID
                        
                        self.saveSession(id: responseSesionID)
                    }
                    
                    if let responseEntryID = jsonData["id"] as? String
                    {
                        self.recordToPost?.id = responseEntryID
                        
                        print("Debug: \(responseEntryID)")
                    }
                }
                
                if let responseData = jsonData["data"] as? [[[String: AnyObject]]] {
                    
                    for array in responseData
                    {
                        let q = DispatchQueue.main
                        
                        q.async {
                            self.appDelegate.records = self.createRecords(from: array)
                        }
                        
                        
                    }
                }
            }
            catch let error
            {
                print(error)
            }
        }
        task.resume()
    }
    
    class func sharedInstance() -> NetworkManager {
        
        struct Singleton
        {
            static let manager = NetworkManager()
        }
        
        return Singleton.manager
    }
    
    private func createRecords(from array: [[String: AnyObject]]) -> [Record] {
        
        var arrayOfRecords = [Record]()
        
        for dict in array
        {
            let record = Record(from: dict)
            
            arrayOfRecords.append(record)
        }
        
        return arrayOfRecords
    }
    
    private func saveSession(id: String)
    {
        let defaults = UserDefaults.standard
        
        defaults.set(sessionID!, forKey: "sessionID")        
    }
    
}
