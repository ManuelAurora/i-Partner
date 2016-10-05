//
//  CreateNewRecordViewController.swift
//  i-Partner
//
//  Created by Мануэль on 03.10.16.
//  Copyright © 2016 AuroraInterplay. All rights reserved.
//

import UIKit

class CreateNewRecordViewController: UIViewController
{
    private let netManager = NetworkManager.sharedInstance()
    
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var textView: UITextView! {
        didSet
        {
            textView.becomeFirstResponder()
        }
    }
    
    @IBAction func saveRecord(_ sender: UIBarButtonItem) {
        
        let date = Date()
        
        let record = Record(with: date, and: textView.text!)
        
        netManager.recordToPost = record
        
        netManager.requestWithMethod(Network.Methods.addEntry)
        
        appDelegate.records.append(record)
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        
        dismiss(animated: true, completion: nil)
    }
   
    
}
