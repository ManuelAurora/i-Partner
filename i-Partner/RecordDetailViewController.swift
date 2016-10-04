//
//  RecordDetailViewController.swift
//  i-Partner
//
//  Created by Мануэль on 03.10.16.
//  Copyright © 2016 AuroraInterplay. All rights reserved.
//

import UIKit

class RecordDetailViewController: UIViewController
{

    var record: Record? {
        didSet
        {
            guard textView != nil else { return }
            
            textView.text = record?.text
        }
    }
    
    @IBOutlet weak var textView: UITextView!
    
    @IBAction func saveRecord(_ sender: UIBarButtonItem) {
        
        record?.text         = textView.text
        record?.dateModified = Date()
        
        dismiss(animated: true, completion: nil)
    }
    
}
