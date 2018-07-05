//
//  HTTPClientError.swift
//  Bytom-Mobile-Wallet-iOS
//
//  Created by 曲终叶落 on 2018/7/5.
//  Copyright © 2018年 曲终叶落. All rights reserved.
//

import Foundation

struct HTTPClientError: Codable {
    var code: Int
    var message: String
}
