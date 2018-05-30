//
//  Engine.swift
//  Bytom-Mobile-Wallet-iOS
//
//  Created by 曲终叶落 on 2018/5/30.
//  Copyright © 2018年 曲终叶落. All rights reserved.
//

import Foundation
import IQKeyboardManagerSwift

class Engine {
    static let instance = Engine()
    
    func start() {
        IocContainer.registerAll()
        thirdParty()
    }
    
    private func thirdParty() {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableAutoToolbar = false
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
    }
}
