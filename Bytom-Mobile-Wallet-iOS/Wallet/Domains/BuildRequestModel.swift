//
//  BuildRequestModel.swift
//  Bytom-Mobile-Wallet-iOS
//
//  Created by xhack on 2018/8/25.
//  Copyright © 2018年 Bytom-Community. All rights reserved.
//

import Foundation

// MARK: - BuildRequest
struct BuildRequest {
    
    var ttl:Int!
    var timeRange:Int!
    var actions = [Action]()

    func toDictionary() -> [String: Any] {
        var dictionary = [String: Any]()
        dictionary["ttl"] = ttl ?? 0
        dictionary["time_range"] = timeRange ?? 0
        dictionary["actions"] = actions.map { $0.toDictionary() }
        return dictionary
    }
}

// MARK: - ActionType
enum ActionType:String {
    case issue = "issue"
    case spend = "spend_account"
    case spendUTXO = "spend_account_unspent_output"
    case controlAddress = "control_address"
    case controlProgram = "control_program"
    case retire = "retire"
    
    var name:String { return self.rawValue }
}

protocol Action {
    var type:String { get }
    // @optional var assetAmount:AssetAmount { get set }
    func toDictionary() -> [String: Any]
}

struct AssetAmount {
    var assetId:String!
    var amount:Int!
}

// MARK: - issueAction
struct IssueAction:Action {
    var assetAmount = AssetAmount()
    var type:String = ActionType.issue.name
    
    func toDictionary() -> [String: Any] {
        var dictionary = [String: Any]()
        dictionary["type"] = type
        dictionary["amount"] = assetAmount.amount
        dictionary["asset_id"] = assetAmount.assetId
        return dictionary
    }
}

// MARK: - spendAction
struct SpendAction:Action {
    var type:String = ActionType.spend.name
    var assetAmount = AssetAmount()
    var accountId:String!
   
    
    func toDictionary() -> [String: Any] {
        var dictionary = [String: Any]()
        dictionary["type"] = type
        dictionary["amount"] = assetAmount.amount
        dictionary["asset_id"] = assetAmount.assetId
        dictionary["account_id"] = accountId!
        return dictionary
    }
}

// MARK: - controlAddressAction
struct ControlAddressAction:Action {
    var type:String = ActionType.controlAddress.name
    var assetAmount = AssetAmount()
    var address:String!
    
    func toDictionary() -> [String: Any] {
        var dictionary = [String: Any]()
        dictionary["type"] = type
        dictionary["amount"] = assetAmount.amount
        dictionary["asset_id"] = assetAmount.assetId
        dictionary["address"] = address!
        return dictionary
    }
}

// MARK: - spendUTXOAction
struct SpendUTXOAction:Action {
    var type:String = ActionType.spendUTXO.name
    var outputId:String!

    func toDictionary() -> [String : Any] {
        var dictionary = [String: Any]()
        dictionary["type"] = type
        dictionary["output_id"] = outputId!
        return dictionary
    }
    
    init(outputId: String) {
        self.outputId = outputId
    }
}


// MARK: - controlProgramAction
struct ControlProgramAction:Action {
    var type:String = ActionType.controlProgram.name
    var assetAmount = AssetAmount()
    var controlProgram:String!
    
    func toDictionary() -> [String : Any] {
        var dictionary = [String: Any]()
        dictionary["type"] = type
        dictionary["amount"] = assetAmount.amount
        dictionary["asset_id"] = assetAmount.assetId
        return dictionary
    }
}

// MARK: - retireAction
struct RetireAction:Action  {
    var type:String = ActionType.retire.name
    var assetAmount = AssetAmount()
    
    func toDictionary() -> [String: Any] {
        var dictionary = [String: Any]()
        dictionary["type"] = type
        dictionary["amount"] = assetAmount.amount
        dictionary["asset_id"] = assetAmount.assetId
        return dictionary
    }
}


