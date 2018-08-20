//
//  String+Ex.swift
//  Bytom-Mobile-Wallet-iOS
//
//  Created by xhack on 2018/8/20.
//  Copyright © 2018年 Bytom-Community. All rights reserved.
//

import Foundation

// MARK: - goDecode - Wallet.framework

enum GoDecodeError: Error {
    case invalidReturnValue
    case decodeFailure
}

extension String {
    
    /// string2data
    var jsonData:Data? {
        return self.data(using: String.Encoding.utf8, allowLossyConversion: false)
    }
    
    /// goDecode
    func goDecode<T>(_ type: T.Type)  throws -> T where T : Decodable {
        guard let data = self.jsonData else {
            throw GoDecodeError.invalidReturnValue
        }
        guard let res = try? JSONDecoder().decode(T.self, from: data) else {
            throw GoDecodeError.decodeFailure
        }
        return res
    }
}



extension String {
    /// 用于预览jsonStr打印的东西 FIMXE: - 1 / 0  -> true / false
    func jsonObject() -> Any? {
        guard let jsonData = self.data(using: String.Encoding.utf8, allowLossyConversion: false) else {
            return nil
        }
        let json = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
        return json
    }
}
