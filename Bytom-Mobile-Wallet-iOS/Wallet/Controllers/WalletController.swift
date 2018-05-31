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
    
    init(walletRepo: WalletRepository) {
        self.walletRepo = walletRepo
    }
    
    func bindInterface(interface: WalletInteface) {
        self.interface = interface
        self.interface.showActivityIndicator()
        self.walletRepo.bytom()
            .done { html -> Void in
                self.interface.reloadWebView(html: html)
            }.ensure {
                self.interface.hideActivityIndicator()
            }.catch { error in
                    print(error)
        }
    }
}
