//
//  GetAssetsRequest.swift
//  Bytom-Mobile-Wallet-iOS
//
//  Created by 曲终叶落 on 2018/6/13.
//  Copyright © 2018年 曲终叶落. All rights reserved.
//

import Foundation

struct GetAssetsRequest: Codable {
    var assets:[AssetsModel]! //= [AssetsModel]()
    var data:AssetsData! // test
}

struct AssetsData: Codable {
    var amount:Int!
    private enum CodingKeys:String, CodingKey {
        case amount = "ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff"
    }
}
