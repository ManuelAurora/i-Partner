//
//  RecordTableViewCell.swift
//  i-Partner
//
//  Created by Мануэль on 03.10.16.
//  Copyright © 2016 AuroraInterplay. All rights reserved.
//

import UIKit

class RecordTableViewCell: UITableViewCell
{
    
    @IBOutlet weak var textView:          UITextView!
    @IBOutlet weak var modifiedLabel:     UILabel!
    @IBOutlet weak var dateCreatedLabel:  UILabel!
    @IBOutlet weak var dateModifiedLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
