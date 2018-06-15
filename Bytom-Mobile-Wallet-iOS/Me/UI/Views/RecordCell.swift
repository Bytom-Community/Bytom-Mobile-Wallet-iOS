//
//  RecordCell.swift
//  Bytom-Mobile-Wallet-iOS
//
//  Created by ldp on 2018/6/14.
//  Copyright © 2018年 曲终叶落. All rights reserved.
//

import UIKit

class RecordCell: UITableViewCell {

    @IBOutlet weak var btmAddressLB: UILabel!
    @IBOutlet weak var tradeStatusLB: UILabel!
    @IBOutlet weak var tradeValueLB: UILabel!
    @IBOutlet weak var tradeTimeLB: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
