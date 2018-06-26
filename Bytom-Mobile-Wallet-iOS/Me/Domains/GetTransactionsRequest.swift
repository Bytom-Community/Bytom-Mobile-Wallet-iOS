//
//  GetTransactionsRequest.swift
//  Bytom-Mobile-Wallet-iOS
//
//  Created by ldp on 2018/6/25.
//  Copyright © 2018年 曲终叶落. All rights reserved.
//

import Foundation

struct GetTransactionsRequest: Codable {
    var transactions = [TransactionsModel]()
}
