//
//  CustomeMessageCell.swift
//  chatterApp
//
//  Created by Karan Sagar on 10/11/19.
//  Copyright © 2019 Karan. All rights reserved.
//

import UIKit

class CustomeMessageCell: UITableViewCell {
    @IBOutlet weak var messageBackgroundView: UIView!
    @IBOutlet weak var avtarImage: UIImageView!
    @IBOutlet weak var senderUserName: UILabel!
    @IBOutlet weak var bodyMessage: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
