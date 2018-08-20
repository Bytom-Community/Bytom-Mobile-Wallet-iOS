//
//  Dictionary+Ex.swift
//  Bytom-Mobile-Wallet-iOS
//
//  Created by xhack on 2018/8/20.
//  Copyright © 2018年 Bytom-Community. All rights reserved.
//

import Foundation

extension Dictionary {
    
    var jsonStr:String? {
        guard let data = try? JSONSerialization.data(withJSONObject: self, options: []) else {
            return nil
        }
        return String(data: data, encoding: String.Encoding.utf8)
    }
}
