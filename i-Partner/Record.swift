//
//  Record.swift
//  i-Partner
//
//  Created by Мануэль on 03.10.16.
//  Copyright © 2016 AuroraInterplay. All rights reserved.
//

import Foundation

struct Record
{
    let dateCreated:  Date
    var dateModified: Date?
    var text:         String
    var modified:     Bool = false
    
    init(with date: Date, and text: String) {
        
        dateCreated  = date
        self.text    = text
        dateModified = nil
    }
    
    init(from dict: [String: AnyObject]) {
        
        let formatter = DateFormatter()
        let da = dict["da"] as? String
        let dm = dict["dm"] as? String
        let textBody = dict["body"] as! String
        
        dateCreated  = formatter.date(from: da!)!        
        
        if dm != nil {
            dateModified = formatter.date(from: dm!)!
            modified = true
        }
        
        text = textBody
    }
    
}
