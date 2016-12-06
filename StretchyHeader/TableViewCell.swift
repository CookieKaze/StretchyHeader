//
//  TableViewCell.swift
//  StretchyHeader
//
//  Created by Erin Luu on 2016-12-06.
//  Copyright © 2016 Erin Luu. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    // MARK: Properties
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var headlineLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
