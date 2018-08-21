//
//  TransactionsModel.swift
//  Bytom-Mobile-Wallet-iOS
//
//  Created by ldp on 2018/6/14.
//  Copyright © 2018年 曲终叶落. All rights reserved.
//

import UIKit

struct TransactionsModel: Codable {
    
    var id = ""

    var timestamp = 0
    
    var timestampToShow:String? {
        
        get{
            let timeSta:TimeInterval = Double(timestamp)
            let dfmatter = DateFormatter()
            dfmatter.dateFormat="yyyy年MM月dd日 HH:mm"

            let date = NSDate(timeIntervalSince1970: timeSta)

            return dfmatter.string(from: date as Date)
        }
    }

    var block_id = ""

    var block_height = 0
    
    var block_transaction_count = 0
    
    var confirmation = 0
    
    var status_fail = false
    
    var op = ""
    
    var fee = 0
    
    var amount = 0
    
    var inputs = [InPutModel]()

    var outputs = [OutPutModel]()
}

struct InPutModel: Codable {
    
    var type = ""
    
    var asset_id = ""
    
    var amount = 0
    
    var address = ""
    
    var spent_output_id = ""
    
}


struct OutPutModel: Codable {
    
    var type = ""
    
    var asset_id = ""
    
    var amount = 0
    
    var address = ""
    
    var output_id = ""
    
    var position:Int? = 0
}
