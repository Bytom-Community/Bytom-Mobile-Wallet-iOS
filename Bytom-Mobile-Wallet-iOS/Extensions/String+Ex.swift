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


// MARK: - convertJsonKeyName
extension String {
    
    private var camelName:String {
        var result = ""
        var flag = false
        self.forEach { c in
            let s = String(c)
            if s == "_" {
                flag = true
            } else {
                if flag {
                    result += s.uppercased()
                    flag = false
                } else {
                    result += s
                }
            }
        }
        return result
    }
    
    private var underscore_name:String {
        var result = ""
        self.forEach { c in
            let num = c.unicodeScalars.map { $0.value }.last!
            let s = String(c)
            if num > 64 && num < 91 {
                result += "_"
                result += s.lowercased()
            } else {
                result += s
            }
        }
        return result
    }
    
    enum JsonKeyType {
        case camel, underscore
    }
    
    func convertJsonKeyName(_ keyType: JsonKeyType) -> String {
        let pattern = "[\"' ]*[^:\"' ]*[\"' ]*:"
        var nsStr = self as NSString
        do {
            let regex = try NSRegularExpression(pattern: pattern, options: NSRegularExpression.Options.caseInsensitive)
            var res = regex.matches(in: nsStr as String, options:[NSRegularExpression.MatchingOptions(rawValue: 0)], range: NSMakeRange(0, (nsStr as NSString).length))
            for i in 0..<res.count {
                res = regex.matches(in: nsStr as String, options:[NSRegularExpression.MatchingOptions(rawValue: 0)], range: NSMakeRange(0, (nsStr as NSString).length)) //str.count
                let c = res[i]
                let cStr = (nsStr as NSString).substring(with: c.range)
                let newStr = keyType == .camel ? cStr.camelName : cStr.underscore_name
                nsStr = nsStr.replacingCharacters(in: c.range, with: newStr) as NSString
            }
        } catch {
            print(error)
        }
        return nsStr as String
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
