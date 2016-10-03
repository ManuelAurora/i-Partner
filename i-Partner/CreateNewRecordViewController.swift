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
    
    @IBAction func cancel(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }

    @IBAction func saveRecord(_ sender: UIButton) {
        
        
    }
    
}
