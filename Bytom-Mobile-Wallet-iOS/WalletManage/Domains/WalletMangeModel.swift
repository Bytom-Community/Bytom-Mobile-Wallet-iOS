//
//  CreateWalletModel.swift
//  Bytom-Mobile-Wallet-iOS
//
//  Created by xhack on 2018/8/19.
//  Copyright © 2018年 Bytom-Community. All rights reserved.
//

import Foundation

// MARK: - sdk Go package API model

// MARK: - WalletCreateKey
struct WalletCreateKeyModel:Codable {
    var data:WalletCreateKeyData!
    var status:String!
    var msg:String!
    var error_detail:String!
    var code:String!
}

struct WalletCreateKeyData:Codable {
    var alias:String!
    var file:String!
    var xpub:String!
}


// MARK: - WalletCreateAccount
struct WalletCreateAccountModel:Codable {
    var data:WalletAccountData!
    var status:String!
}

struct WalletAccountData:Codable {
    var alias:String!
    var id:String! // accountID
    var key_index:Int!
    var quorum:Int!
    var xpubs:[String]!
}

// MARK: - WalletListAccounts
struct WalletListAccountsModel:Codable {
    var data:[WalletAccountData]!
    var status:String!
}



// MARK: - WalletCreateAccountReceiver
struct WalletCreateAddressModel:Codable {
    var data:WalletCreateAddressData!
    var status:String!
}

struct WalletCreateAddressData:Codable {
    var address:String
    var control_program:String
}

// MARK: - WalletListAddress
struct WalletAddressModel:Codable {
    var data:[WalletAddressData]!
    var status:String!
}

struct WalletAddressData:Codable {
    var account_alias:String!
    var account_id:String!
    var address:String!
    var control_program:String!
    var change: Bool?
}

// MARK: - WalletResetKeyPassword
struct WalletResetKeyPasswordModel:Codable {
    var data:WalletResetKeyPasswordData!
    var status:String!
}
struct WalletResetKeyPasswordData:Codable {
    var changed:Bool!
}

// MARK: - WalletRestoreWallet
struct WalletRestoreModel:Codable {
    var status:String!
    var code:String!
    var msg:String!
    var error_detail:String!
}

// MARK: -  WalletBackupWallet
struct WalletBackupModel:Codable {
    var data:WalletImage!
    var status:String!
}

struct WalletImage:Codable {
    var accountImage:AccountImage!
    var assetImage:AssetImage!
    var keyImages:KeyImages!
    
    private enum CodingKeys:String, CodingKey {
        case accountImage = "account_image"
        case assetImage = "asset_image"
        case keyImages = "key_images"
    }
}

struct AccountImage:Codable {
    var slices:[AccountImageSlices]!
}

struct AccountImageSlices:Codable {
    var account:AccountImageSliceAccount!
    var contractIndex:Int!
    private enum CodingKeys:String, CodingKey {
        case account = "account"
        case contractIndex = "contract_index"
    }
}

struct AccountImageSliceAccount:Codable {
    var type:String!
    var xpubs:[String]!
    var quorum:Int!
    var id:String!
    var alias:String!
    var keyIndex:Int!
    
    private enum CodingKeys:String, CodingKey {
        case type = "type"
        case xpubs = "xpubs"
        case quorum = "quorum"
        case id = "id"
        case alias = "alias"
        case keyIndex = "key_index"
    }
}

struct AssetImage:Codable {
    var assets:[EmptyType]!
}

struct EmptyType:Codable { }

struct KeyImages:Codable  {
    var xkeys:[KeyImagesXkey]!
}

struct KeyImagesXkey:Codable {
    var alias : String!
    var crypto : KeyImagesXkeyCrypto!
    var id : String!
    var type : String!
    var version : Int!
    var xpub : String!
}

struct KeyImagesXkeyCrypto:Codable {
    var cipher : String!
    var cipherparams : Cipherparam!
    var ciphertext : String!
    var kdf : String!
    var kdfparams : Kdfparam!
    var mac : String!
}

struct Cipherparam:Codable{
    var iv : String!
}

struct Kdfparam:Codable{
    var dklen : Int!
    var n : Int!
    var p : Int!
    var r : Int!
    var salt : String!
}

// MARK: - WalletBackupWallet:  WalletImage => Json
extension WalletImage {
    func toDictionary() -> [String:Any] {
        var dictionary = [String:Any]()
        if accountImage != nil{
            dictionary["accountImage"] = accountImage.toDictionary()
        }
        if assetImage != nil{
            dictionary["assetImage"] = assetImage.toDictionary()
        }
        if keyImages != nil{
            dictionary["keyImages"] = keyImages.toDictionary()
        }
        return dictionary
    }
}

extension AccountImage {
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if slices != nil{
            var dictionaryElements = [[String:Any]]()
            for slicesElement in slices {
                dictionaryElements.append(slicesElement.toDictionary())
            }
            dictionary["slices"] = dictionaryElements
        }
        return dictionary
    }
}

extension AccountImageSlices {
    func toDictionary() -> [String:Any] {
        var dictionary = [String:Any]()
        if account != nil{
            dictionary["account"] = account.toDictionary()
        }
        if contractIndex != nil{
            dictionary["contractIndex"] = contractIndex
        }
        return dictionary
    }
}


extension AccountImageSliceAccount {
    func toDictionary() -> [String:Any] {
        var dictionary = [String:Any]()
        if alias != nil{
            dictionary["alias"] = alias
        }
        if id != nil{
            dictionary["id"] = id
        }
        if keyIndex != nil{
            dictionary["keyIndex"] = keyIndex
        }
        if quorum != nil{
            dictionary["quorum"] = quorum
        }
        if type != nil{
            dictionary["type"] = type
        }
        if xpubs != nil{
            dictionary["xpubs"] = xpubs
        }
        return dictionary
    }
}


extension AssetImage {
    func toDictionary() -> [String:Any] {
        var dictionary = [String:Any]()
        if assets != nil{
            dictionary["assets"] = assets
        }
        return dictionary
    }
}


extension KeyImages {
    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()
        if xkeys != nil{
            var dictionaryElements = [[String:Any]]()
            for xkeysElement in xkeys {
                dictionaryElements.append(xkeysElement.toDictionary())
            }
            dictionary["xkeys"] = dictionaryElements
        }
        return dictionary
    }
}

extension KeyImagesXkey {
    
    func toDictionary() -> [String:Any] {
        var dictionary = [String:Any]()
        if alias != nil{
            dictionary["alias"] = alias
        }
        if crypto != nil{
            dictionary["crypto"] = crypto.toDictionary()
        }
        if id != nil{
            dictionary["id"] = id
        }
        if type != nil{
            dictionary["type"] = type
        }
        if version != nil{
            dictionary["version"] = version
        }
        if xpub != nil{
            dictionary["xpub"] = xpub
        }
        return dictionary
    }
}


extension KeyImagesXkeyCrypto {
    func toDictionary() -> [String:Any] {
        var dictionary = [String:Any]()
        if cipher != nil{
            dictionary["cipher"] = cipher
        }
        if cipherparams != nil{
            dictionary["cipherparams"] = cipherparams.toDictionary()
        }
        if ciphertext != nil{
            dictionary["ciphertext"] = ciphertext
        }
        if kdf != nil{
            dictionary["kdf"] = kdf
        }
        if kdfparams != nil{
            dictionary["kdfparams"] = kdfparams.toDictionary()
        }
        if mac != nil{
            dictionary["mac"] = mac
        }
        return dictionary
    }
}

extension Cipherparam {
    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()
        if iv != nil{
            dictionary["iv"] = iv
        }
        return dictionary
    }
}

extension Kdfparam {
    func toDictionary() -> [String:Any] {
        var dictionary = [String:Any]()
        if dklen != nil{
            dictionary["dklen"] = dklen
        }
        if n != nil{
            dictionary["n"] = n
        }
        if p != nil{
            dictionary["p"] = p
        }
        if r != nil{
            dictionary["r"] = r
        }
        if salt != nil{
            dictionary["salt"] = salt
        }
        return dictionary
    }
}










