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
    let dateModified: Date?
    var text:         String
    let modified:     Bool
    
    init(with date: Date, and text: String) {
        
        dateCreated  = date
        self.text    = text
        modified     = false
        dateModified = nil
    }
    
}
