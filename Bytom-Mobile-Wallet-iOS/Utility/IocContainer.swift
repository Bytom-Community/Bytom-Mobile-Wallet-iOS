//
//  IocContainer.swift
//  Bytom-Mobile-Wallet-iOS
//
//  Created by 曲终叶落 on 2018/5/30.
//  Copyright © 2018年 曲终叶落. All rights reserved.
//

import Foundation
import Swinject

class IocContainer {
    static let container = Swinject.Container()
    
    static func resolve<Service>(_ service: Service.Type) -> Service {
        return container.resolve(service)!
    }
    
    static func registerAll() {
        WelcomeIocContainer.register(container: container)
        WalletIocContainer.register(container: container)
        TradeIocContainer.register(container: container)
        MeIocContainer.register(container: container)
    }
}
