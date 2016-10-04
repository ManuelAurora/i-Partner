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
    
    @IBOutlet weak var textView: UITextField! {
        didSet
        {
            textView.becomeFirstResponder()
        }
    }
    
    @IBAction func saveRecord(_ sender: UIBarButtonItem) {
        
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        
        dismiss(animated: true, completion: nil)
    }
   
    
}
