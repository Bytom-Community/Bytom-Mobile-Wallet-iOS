//
//  RecordPresenter.swift
//  Bytom-Mobile-Wallet-iOS
//
//  Created by ldp on 2018/6/25.
//  Copyright © 2018年 曲终叶落. All rights reserved.
//

import Foundation
import PromiseKit

class RecordPresenter {
    private weak var interface: RecordInterface!
    private let meRepo: MeRepository
    private var transactions = [TransactionsModel]()

    private var records = [RecordModel]()
    
    private var allTrans = [String:[TransactionsModel]]()
    
    private var sectionSource = [String:String]()

    init(meRepo: MeRepository) {
        self.meRepo = meRepo
    }
    
    func bindInterface(interface: RecordInterface) {
        self.interface = interface
        getListTransactions()
    }
    
    private func getListTransactions() {
        self.interface.showActivityIndicator()
        self.meRepo.getListTransactions(address:
            "bm1qe3g790gkvgg8qy8lhkd42dnq59e2g52cychplv", assetID: "ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff").done { (request) in
                self.transactions = request.data
                
                self.transactions.sort(by: { (trans1, trans2) -> Bool in
                    return trans1.timestamp > trans2.timestamp
                })
                
                
                for trans in self.transactions {
                    
                    let key = self.timeStampToString(timeStamp: "\(trans.timestamp)")
                    
                    if self.allTrans[key] == nil {
                        self.allTrans[key] = [TransactionsModel]()
                        
                        let record = RecordModel()
                        record.headerTitle = key
                        self.records.append(record)
                    }

                    self.allTrans[key]?.append(trans)
                }
                
                self.interface.reload()
            }.ensure {
                self.interface.hideActivityIndicator()
            }.catch { error in
                print(error)
        }
    }

    var section: Int {
        return self.records.count
    }
    
    func row(section: Int) -> Int {
        
        let key = self.records[section].headerTitle

        let values = allTrans[key]

        return values!.count
    }
    
    func record(section: Int) -> RecordModel {

        return self.records[section]
    }
    
    func transaction(section: Int, row: Int) -> TransactionsModel {
        
        let key = self.records[section].headerTitle

        let values = allTrans[key]

        return values![row]
    }

    func timeStampToString(timeStamp:String)->String {
        
        let string = NSString(string: timeStamp)
        
        let timeSta:TimeInterval = string.doubleValue
        let dfmatter = DateFormatter()
        dfmatter.dateFormat="yyyy年MM月"
        
        let date = NSDate(timeIntervalSince1970: timeSta)
        
        return dfmatter.string(from: date as Date)
    }

}
