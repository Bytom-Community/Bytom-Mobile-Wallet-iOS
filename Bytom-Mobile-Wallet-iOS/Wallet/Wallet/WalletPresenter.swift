//
//  WalletPresenter.swift
//  Bytom-Mobile-Wallet-iOS
//
//  Created by 曲终叶落 on 2018/5/30.
//  Copyright © 2018年 曲终叶落. All rights reserved.
//

import Foundation
import PromiseKit

class WalletPresenter {
    private weak var interface: WalletInteface!
    private let walletRepo: WalletRepository
    private var assets = [AssetsModel]()
    private let urlErrorHandler: URLErrorHandler
    
    init(walletRepo: WalletRepository, urlErrorHandler: URLErrorHandler) {
        self.walletRepo = walletRepo
        self.urlErrorHandler = urlErrorHandler
    }
    
    func bindInterface(interface: WalletInteface) {
        self.interface = interface
        self.interface.reload()
        getListAssets()
    }
    
    private func getListAssets() {
        self.interface.showActivityIndicator()
        self.walletRepo.getListAssets(address:
            selectedAccount().defaultAddress).done { (assetsRequest) in
                self.assets = assetsRequest.assets
                self.interface.reload()
            }.ensure {
                self.interface.hideActivityIndicator()
            }.catch { error in
                self.urlErrorHandler.handle(error: error, interface: self.interface)
        }
    }
    
    
    var row: Int {
        return assets.count
    }
    
    func asset(row: Int) -> AssetsModel {
        return assets[row]
    }
}

extension WalletPresenter {
    
    // TODO: - 本地保存选择的账号
    func selectedAccount() -> WalletManageData {
        // 现在默认第一个
        return WalletManageRepository.getWalletAccountList().first!
    }
}
