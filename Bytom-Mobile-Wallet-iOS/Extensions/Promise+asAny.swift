//
//  Promise+asAny.swift
//  Bytom-Mobile-Wallet-iOS
//
//  Created by 曲终叶落 on 2018/5/29.
//  Copyright © 2018年 曲终叶落. All rights reserved.
//

import Foundation
import PromiseKit

extension Promise {
    typealias Result = (data: Data, response: URLResponse)
    
    func asObject<T: Codable>() -> Promise<T> {
        return map {
            try JSONDecoder().decode(T.self, from: ($0 as? Result)?.data ?? Data())
        }
    }
    
    func asObject<T: Codable>() -> Promise<[T]> {
        return map {
            try JSONDecoder().decode([T].self, from: ($0 as? Result)?.data ?? Data())
        }
    }

    func asString() -> Promise<String> {
        return map {
            let result = $0 as! Result
            return String(data: result.data, encoding: result.response.encoding ?? .utf8) ?? ""
        }
    }
}

extension URLResponse {
    fileprivate var encoding: String.Encoding? {
        guard let encodingName = textEncodingName else { return nil }
        let encoding = CFStringConvertIANACharSetNameToEncoding(encodingName as CFString)
        guard encoding != kCFStringEncodingInvalidId else { return nil }
        return String.Encoding(rawValue: CFStringConvertEncodingToNSStringEncoding(encoding))
    }
}
