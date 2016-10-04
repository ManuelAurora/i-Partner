//
//  ViewController.swift
//  i-Partner
//
//  Created by Мануэль on 03.10.16.
//  Copyright © 2016 AuroraInterplay. All rights reserved.
//

import UIKit

class RecordsTableViewController: UITableViewController
{
    
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    private lazy var formatter: DateFormatter = {
        
        let fm = DateFormatter()
        
        fm.dateFormat = "d MMMM hh:mm"
 
        return fm
    }()
    
    @IBAction func createNewRecord(_ sender: UIBarButtonItem) {
                
        createRecord()
        
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        
        let manager = NetworkManager.sharedInstance()
        
        if let id = defaults.string(forKey: "sessionID")
        {
            NetworkManager.sharedInstance().sessionID = id
        }
        else
        {
            manager.requestWithMethod(Network.Methods.newSession)
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appDelegate.records.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let record = appDelegate.records[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.ID.recordCell) as! RecordTableViewCell
        
        if record.modified, let dateMod = record.dateModified {
            cell.dateModifiedLabel.text = formatter.string(from: dateMod)
        }
        
        cell.dateCreatedLabel.text = formatter.string(from: record.dateCreated)
        
        cell.textView.text = record.text
        
        cell.dateModifiedLabel.isHidden = !record.modified
        cell.modifiedLabel.isHidden     = !record.modified
                    
        return cell
    }
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard segue.identifier == Storyboard.Segues.showRecordDetail else { return }
        
        let destinationVC = segue.destination as! RecordDetailViewController
        
        if let sender = sender as? RecordTableViewCell
        {
            destinationVC.record = appDelegate.records[tableView.indexPath(for: sender)!.row]
        }
    }
    
    func createRecord() {
        
        let controller    = storyboard?.instantiateViewController(withIdentifier: Storyboard.ID.newRecordVC) as! CreateNewRecordViewController
        let navController = UINavigationController(rootViewController: controller)
        
        present(navController, animated: true, completion: nil)
    }
}

