//
//  FirstTableViewCell.swift
//  TableViewSample
//
//  Created by 손성빈 on 2017. 7. 24..
//  Copyright © 2017년 seongbinson. All rights reserved.
//

import UIKit

class FirstTableViewCell: UITableViewCell {

    
    @IBOutlet weak var photoView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
