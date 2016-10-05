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
    var record: Record?
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var textView: UITextView!
    
    @IBAction func saveRecord(_ sender: UIBarButtonItem) {
        
        record?.text         = textView.text
        record?.dateModified = Date()
        record?.modified     = true
        
        self.navigationController!.popViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        textView.text = record?.text
    }
}

