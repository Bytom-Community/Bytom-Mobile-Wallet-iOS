//
//  WalletManageRepository.swift
//  Bytom-Mobile-Wallet-iOS
//
//  Created by xhack on 2018/8/19.
//  Copyright © 2018年 Bytom-Community. All rights reserved.
//

import Foundation
import PromiseKit

enum LoaclResponse {
    case success
    case fail(String)
}

struct WalletManageRepository {
    
    // TODO: - 优化及进一步错误处理
    static func createWallet(alias:String, password:String) -> LoaclResponse {
        
        // 1 - xpub
        let createKey = try! WalletCreateKey(alias, password).goDecode(WalletCreateKeyModel.self)
    
        if createKey.status == "fail"  {
            return LoaclResponse.fail(createKey.error_detail)
        }
        
        // 2 - account
        let alias = createKey.data.alias
        let xpub = createKey.data.xpub

        let createAccount = try! WalletCreateAccount(alias, 1, xpub).goDecode(WalletCreateAccountModel.self)
        
        // 3 - address
        let accountID = createAccount.data.id
        let accountAlias = createAccount.data.alias
        
        _ = try! WalletCreateAccountReceiver(accountID, accountAlias).goDecode(WalletCreateAddressModel.self)
        

        return LoaclResponse.success
    }
    
    static func getWalletAccountList() -> [WalletManageData] {
        
        let res = try! WalletListAccounts().goDecode(WalletListAccountsModel.self)
        
        let data = res.data.map { accouts -> WalletManageData in
            var manageData = WalletManageData()
            manageData.accountID = accouts.id
            manageData.alias = accouts.alias
            manageData.rootXPub = accouts.xpubs.first! // FIXME: - rootXPub
            manageData.xpubs = accouts.xpubs
            let address = try! WalletListAddress(accouts.id, accouts.alias).goDecode(WalletAddressModel.self)
            manageData.address = address.data.map { $0.address }
            manageData.defaultAddress = address.data.first!.address  // 地址暂时默认列表第一个 TODO: - 默认选项
            return manageData
        }
        return data
    }
}

// MARK: - create address
extension WalletManageRepository {
    
    static func createNewAddress(accountID:String, accountAlias:String) -> WalletCreateAddressModel? {
        let accountReceiver = try? WalletCreateAccountReceiver(accountID, accountAlias).goDecode(WalletCreateAddressModel.self)
        return accountReceiver
    }
}



// MARK: - BackupWallet 、RestoreWallet
extension WalletManageRepository {
    
    static func getWalletBackupWalletImage() -> String? {
        let backupWallet = try! WalletBackupWallet().goDecode(WalletBackupModel.self)
        return backupWallet.data.toDictionary().jsonStr
    }
    
    // FIXME: - bug
    static func walletRestore(walletImage: String) -> LoaclResponse {
        let res = WalletRestoreWallet(walletImage) // GO-API直接奔溃
        print(res ?? "")
        return LoaclResponse.fail("FIXME: 直接奔溃")
    }
}

// MARK: - changePassword
extension WalletManageRepository {
    
    static func changePassword(_ rootXPub: String, oldPassword:String, newPassword:String) -> LoaclResponse  {
        let res = try! WalletResetKeyPassword(rootXPub, oldPassword, newPassword).goDecode(WalletResetKeyPasswordModel.self)
        if res.data.changed == true {
             return LoaclResponse.success
        } else {
             return LoaclResponse.fail("请确认密码输入是否正确")
        }
    }
}








