//
//  TransactionsModel.swift
//  Bytom-Mobile-Wallet-iOS
//
//  Created by ldp on 2018/6/14.
//  Copyright © 2018年 曲终叶落. All rights reserved.
//

import UIKit

struct TransactionsModel: Codable {
    
    var isExpanded: Bool? = false

    var ID = ""

    var timestamp = ""
    
    var blockID = ""
    
    var blockHeight = ""
    
    var blockTransactionsCount = 0
    
    var confirmation = ""
    
    var inputs = [InOutPutModel]()
    
    var outputs = [InOutPutModel]()
    
    var allPuts = [InOutPutModel]()
}

struct InOutPutModel: Codable {
    
    var type = ""
    
    var assetID = ""
    
    var amount = ""
    
    var address = ""
    
    var spentOutputID = ""
    
    var OutputID = ""
}

