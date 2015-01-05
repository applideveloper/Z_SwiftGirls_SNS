//
//  SweetTableViewCell.swift
//  SwifferApp
//
//  Created by 荒木 敦 on 2015/01/05.
//  Copyright (c) 2015年 Training. All rights reserved.
//

import UIKit

class SweetTableViewCell: UITableViewCell {
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    @IBOutlet weak var sweetTextView: UITextView!
    
    required override convenience init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        self.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
