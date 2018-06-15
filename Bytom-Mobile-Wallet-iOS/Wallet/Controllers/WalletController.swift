//
//  WalletController.swift
//  Bytom-Mobile-Wallet-iOS
//
//  Created by 曲终叶落 on 2018/5/30.
//  Copyright © 2018年 曲终叶落. All rights reserved.
//

import Foundation
import PromiseKit

class WalletController {
    private weak var interface: WalletInteface!
    private let walletRepo: WalletRepository
    private var assets = [AssetsModel]()
    
    init(walletRepo: WalletRepository) {
        self.walletRepo = walletRepo
    }
    
    func bindInterface(interface: WalletInteface) {
        self.interface = interface
        getListAssets()
    }
    
    private func getListAssets() {
        self.interface.showActivityIndicator()
        self.walletRepo.getListAssets(address:
            "bm1q5p9d4gelfm4cc3zq3slj7vh2njx23ma2cf866j").done { (assetsRequest) in
                self.assets = assetsRequest.assets
                self.interface.reload()
            }.ensure {
                self.interface.hideActivityIndicator()
            }.catch { error in
                print(error)
        }
    }
    
    var row: Int {
        return assets.count
    }
    
    func asset(row: Int) -> AssetsModel {
        return assets[row]
    }
}
