//
//  JSONHelper + Serializable.swift
//  Bytom-Mobile-Wallet-iOS
//
//  Created by 曲终叶落 on 2018/5/29.
//  Copyright © 2018年 曲终叶落. All rights reserved.
//

import Foundation
import JSONHelper

infix operator --> : AssignmentPrecedence

@discardableResult func --> <T>(property: T?, value: inout Any?) -> Any? {
    if let int = property as? Int {
        value = int as Any?
    } else if let string = property as? String {
        value = string as Any?
    } else if let float = property as? Float {
        value = float as Any?
    } else if let double = property as? Double {
        value = double as Any?
    } else if let bool = property as? Bool {
        value = bool as Any?
    } else if let date = property as? Date {
        value = Int(date.timeIntervalSince1970) as Any?
    }else if let instance = property as? Serializable {
        value = try! instance.toDictionary() as Any?
    }
    return value
}

@discardableResult func --> (properties: [Any]?, value: inout Any?) -> Any? {
    if let intArray = properties as? [Int] {
        value = intArray as Any?
    } else if let stringArray = properties as? [String] {
        value = stringArray as Any?
    } else if let floatArray = properties as? [Float] {
        value = floatArray as Any?
    } else if let doubleArray = properties as? [Double] {
        value = doubleArray as Any?
    } else if let boolArray = properties as? [Bool] {
        value = boolArray as Any?
    } else if let instances = properties as? [Serializable] {
        value = instances.map { ins in try! ins.toDictionary() } as Any?
    }
    return value
}

func JSONStringify(_ value: Any) -> String{
    if JSONSerialization.isValidJSONObject(value) {
        do{
            let data = try JSONSerialization.data(withJSONObject: value, options: JSONSerialization.WritingOptions(rawValue: 0))
            if let string = NSString(data: data, encoding: String.Encoding.utf8.rawValue) {
                return string as String
            }
        }catch {
            print("error")
        }
    }
    return ""
}

func JSONParse<T: Deserializable>(json: String) -> T? {
    var result: T?
    result <-- json
    return result == nil ? nil : result
}
