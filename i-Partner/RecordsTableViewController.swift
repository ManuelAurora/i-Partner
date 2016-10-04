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
    var records = [Record]()
    
    @IBAction func createNewRecord(_ sender: UIBarButtonItem) {
        
        createRecord()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let manager = NetworkManaged()
        
        manager.requestWithMethod(Network.Methods.newSession)
        
        let date  = Date()
        let text  = "If a property always takes the same initial value, provide a default value rather than setting a value within an initializer. The end result is the same, but the default value ties the property’s initialization more closely to its declaration. It makes for shorter, clearer initializers and enables you to infer the type of the property from its default value. The default value also makes it easier for you to take advantage of default initializers and initializer inheritance, as described later in this chapter."
        
        let record = Record(with: date, and: text)
        
        records.append(record)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return records.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let record = records[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.ID.recordCell) as! RecordTableViewCell
        
        cell.dateCreatedLabel.text = record.dateCreated.description
        cell.textView.text         = record.text
        
        return cell
    }
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard segue.identifier == Storyboard.Segues.showRecordDetail else { return }
        
        let destinationVC = segue.destination as! RecordDetailViewController
        
        if let sender = sender as? RecordTableViewCell
        {
            destinationVC.record = records[tableView.indexPath(for: sender)!.row]
        }
    }
    
    func createRecord() {
        
        let controller    = storyboard?.instantiateViewController(withIdentifier: Storyboard.ID.newRecordVC) as! CreateNewRecordViewController
        let navController = UINavigationController(rootViewController: controller)
        
        present(navController, animated: true, completion: nil)
    }
}

