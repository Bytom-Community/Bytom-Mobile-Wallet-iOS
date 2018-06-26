//
//  MeIocContainer.swift
//  Bytom-Mobile-Wallet-iOS
//
//  Created by 曲终叶落 on 2018/5/30.
//  Copyright © 2018年 曲终叶落. All rights reserved.
//

import Foundation
import Swinject

class MeIocContainer {
    
    static func register(container: Container) {
        container.register(MeRepository.self) { _ in MeRepository() }
        container.register(RecordController.self) { _ in RecordController(meRepo: container.resolve(MeRepository.self)! )}
    }
}

