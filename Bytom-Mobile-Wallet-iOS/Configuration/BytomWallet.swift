//
//  BytomWallet.swift
//  Bytom-Mobile-Wallet-iOS
//
//  Created by xhack on 2018/8/22.
//  Copyright © 2018年 Bytom-Community. All rights reserved.
//

import Foundation

class BytomWallet {
    
    static let shared = BytomWallet()
    
    private init() { }
    
    // TODO: - optimize
    lazy var currentAccount:AccountData? = {
        return getDefaultAccount()
    }()
    
    private func getDefaultAccount() -> AccountData? {
        let accountList = WalletManageRepository.getWalletAccountList()
        guard accountList.count > 0 else {
            return nil
        }
        let alias = Config.selectedAccount()
        let account = accountList.filter { $0.alias == alias }.first
        if let account = account {
            return account
        } else {
            let defaultAccount = accountList.first!
            Config.setSelectedAccount(alias: defaultAccount.alias)
            return defaultAccount
        }
    }
}

