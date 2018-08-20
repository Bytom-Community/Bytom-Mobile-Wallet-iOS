//
//  TransactionsModel.swift
//  Bytom-Mobile-Wallet-iOS
//
//  Created by ldp on 2018/6/14.
//  Copyright © 2018年 曲终叶落. All rights reserved.
//

import UIKit

struct TransactionsModel: Codable {
    
    var ID = ""

    var timestamp = ""
    
    var timestampToShow:String? {
        
        get{
            let string = NSString(string: timestamp)
            
            let timeSta:TimeInterval = string.doubleValue
            let dfmatter = DateFormatter()
            dfmatter.dateFormat="yyyy年MM月dd日 HH:mm"
            
            let date = NSDate(timeIntervalSince1970: timeSta)
            
            return dfmatter.string(from: date as Date)
        }
    }

    var blockID = ""
    
    var blockHeight = ""
    
    var blockTransactionsCount = 0
    
    var confirmation = ""
    
    var op = ""
    
    var fee = ""
    
    var inputs = [InPutModel]()

    var outputs = [OutPutModel]()
}

struct InPutModel: Codable {
    
    var type = ""
    
    var assetID = ""
    
    var amount = ""
    
    var address = ""
    
    var spentOutputID = ""
    
}


struct OutPutModel: Codable {
    
    var type = ""
    
    var assetID = ""
    
    var amount = ""
    
    var address = ""
    
    var OutputID = ""
    
    var position:Int? = 0
}
