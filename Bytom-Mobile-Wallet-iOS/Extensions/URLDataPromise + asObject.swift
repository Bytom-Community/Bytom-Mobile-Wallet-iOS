//
//  URLDataPromise + asObject.swift
//  Bytom-Mobile-Wallet-iOS
//
//  Created by 曲终叶落 on 2018/5/29.
//  Copyright © 2018年 曲终叶落. All rights reserved.
//

import Foundation
import JSONHelper
import PromiseKit

extension URLDataPromise {
    func asObject<T: Deserializable>() -> Promise<T> {
        return asString().then { jsonString -> T in
            var result: T?
            result <-- jsonString
            return result!
        }
    }
    
    func asObject<T: Deserializable>() -> Promise<T?> {
        return asString().then { jsonString -> T? in
            var result: T?
            result <-- jsonString
            return result
        }
    }
    
    func asObject<T: Deserializable>() -> Promise<[T]> {
        return asArray().then { jsonArray -> [T] in
            var result: [T]?
            result <-- jsonArray
            return result == nil ? [T]() : result!
        }
    }
    
    func asObject() -> Promise<[String]> {
        return asArray()
            .then { arr -> [String] in
                return arr as! [String]
        }
    }
    
    func asObject() -> Promise<Double> {
        return asString().then { jsonString -> Double in
            return Double(jsonString) ?? 0.0
        }
    }
    
    func asInt() -> Promise<Int> {
        return asString().then { jsonString -> Int in
            return Int(jsonString) ?? 0
        }
    }
    
    func asBool() -> Promise<Bool> {
        return asString().then { jsonString -> Bool in
            return jsonString == "1" || jsonString == "true"
        }
    }
}
