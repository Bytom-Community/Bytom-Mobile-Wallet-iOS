//
//  BytomUnit+Ex.swift
//  Bytom-Mobile-Wallet-iOS
//
//  Created by xhack on 2018/8/27.
//  Copyright © 2018年 Bytom-Community. All rights reserved.
//

import Foundation


// TODO: - BytomUnitConvertible

//protocol BytomUnitConvertible {
//    associatedtype WarpperType
//    var unit:WarpperType{ get }
//}
//extension BytomUnitConvertible where WarpperType == Int {
//}

// MARK: - BytomUnit Conversion
extension Int {
    
    enum BytomUnit {
        case BTM
        case mBTM
        case NEU
    }
    
    func BTM(to unit: BytomUnit) -> String {
        switch unit {
        case .BTM:
            return Double(self).format
        case .mBTM:
            return Double(self*1000).format
        case .NEU:
            return Double(self*100_000_000).format
        }
    }
    
    func mBTM(to unit: BytomUnit) -> String {
        switch unit {
        case .BTM:
            return (Double(self)/1000).format
        case .mBTM:
            return Double(self).format
        case .NEU:
            return (Double(self*100_000)).format
        }
    }
    
    func NEU(to unit: BytomUnit) -> String {
        switch unit {
        case .BTM:
            return (Double(self)/100_000_000).format
        case .mBTM:
            return (Double(self)/100_000).format
        case .NEU:
            return Double(self).format
        }
    }
}

extension Double {
    var format:String {
        let res = String(format: "%.4f", self)
        return res.hasSuffix(".0000") ? "\(Int(self))" : res
    }
}

