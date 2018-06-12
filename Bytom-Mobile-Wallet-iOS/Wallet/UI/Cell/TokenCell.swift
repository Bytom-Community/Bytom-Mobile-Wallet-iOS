//
//  TokenCell.swift
//  Bytom-Mobile-Wallet-iOS
//
//  Created by 曲终叶落 on 2018/6/11.
//  Copyright © 2018年 曲终叶落. All rights reserved.
//

import UIKit

class TokenCell: UITableViewCell {
    @IBOutlet weak var tokenNameLb: UILabel!
    @IBOutlet weak var tokenCountLb: UILabel!
    @IBOutlet weak var costLb: UILabel!
    
    var asset = AssetsModel() {
        didSet {
            tokenCountLb.text = "\(asset.amount)"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
