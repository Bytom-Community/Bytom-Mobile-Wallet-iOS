//
//  Config.swift
//  Bytom-Mobile-Wallet-iOS
//
//  Created by ldp on 2018/8/22.
//  Copyright © 2018年 Bytom-Community. All rights reserved.
//

import Foundation

class Config {
    
    static let CoinArray: [String] = ["美元 - USDT","人民币 - CNY","比特币 - BTC"]
    
    static func selectedCoin() -> String {
        let value = UserDefaults.standard.string(forKey: "COIN")
        
        if value != nil {
            return value!
        }

        return Config.CoinArray[0]
    }
    
    static func setSelectedCoin(coin: String) {
        UserDefaults.standard.set(coin, forKey: "COIN")
    }
    
    static func selectedNode() -> String {
        let value = UserDefaults.standard.string(forKey: "NODE")
        
        if value != nil {
            return value!
        }
        
        return "https://w3.bytom.io"
    }
    
    static func setSelectedNode(node: String) {
        UserDefaults.standard.set(node, forKey: "NODE")
    }
    
}

extension Config {
    
    static func setSelectedAccount(alias: String) {
        UserDefaults.standard.set(alias, forKey: "ACCOUNT")
    }
    
    static func selectedAccount() -> String? {
        return UserDefaults.standard.string(forKey: "ACCOUNT")
    }
}



