//
//  WalletRepository.swift
//  Bytom-Mobile-Wallet-iOS
//
//  Created by 曲终叶落 on 2018/5/30.
//  Copyright © 2018年 曲终叶落. All rights reserved.
//

import Foundation
import PromiseKit

struct WalletRepository {
    func bytom() -> Promise<String> {
        return URLSession.shared.GET("https://bytom.io/").asString()
    }
}
