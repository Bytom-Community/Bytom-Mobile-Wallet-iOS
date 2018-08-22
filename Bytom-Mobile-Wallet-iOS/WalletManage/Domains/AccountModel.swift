//
//  WalletAccountModel.swift
//  Bytom-Mobile-Wallet-iOS
//
//  Created by Swift on 2018/8/22.
//  Copyright © 2018年 Bytom-Community. All rights reserved.
//

import Foundation


// MARK: - AccountData
struct AccountData {
    var alias = ""
    var accountID = ""
    var defaultAddress = "" // 暂时默认第一个
    var rootXPub = "" // 暂时默认第一个
    var xpubs = [String]()
    var address = [String]()
    //var allAddress = [WalletAddressModel]()
    // TODO: - 添加其他
}
