//
//  Utils.swift
//  i-Partner
//
//  Created by Мануэль on 03.10.16.
//  Copyright © 2016 AuroraInterplay. All rights reserved.
//

import UIKit

struct Storyboard
{
    struct Segues
    {
        static let showRecordDetail = "ShowRecordDetail"
    }
    
    struct ID
    {
        static let newRecordVC = "CreateNewRecord"
        static let recordCell  = "RecordCell"
    }
}

struct Network
{
    static let token = "YCa29lU-3m-h0bfdgG"
    
    static let url = "https://bnet.i-partner.ru/testAPI/"
    
    struct Methods
    {
        static let newSession = "new_session"
        static let getEntries = "get_entries"
        static let addEntry   = "add_entry"
    }
}
