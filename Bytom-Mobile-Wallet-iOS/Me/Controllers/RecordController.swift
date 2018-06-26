//
//  RecordController.swift
//  Bytom-Mobile-Wallet-iOS
//
//  Created by ldp on 2018/6/25.
//  Copyright © 2018年 曲终叶落. All rights reserved.
//

import Foundation
import PromiseKit

class RecordController {
    private weak var interface: RecordInterface!
    private let meRepo: MeRepository
    private var transactions = [TransactionsModel]()
    private var allTrans = [TransactionsModel]()

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
            "bm1q5p9d4gelfm4cc3zq3slj7vh2njx23ma2cf866j", assetID: "ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff").done { (request) in
                self.transactions = request.transactions
                self.interface.reload()
            }.ensure {
                self.interface.hideActivityIndicator()
            }.catch { error in
                print(error)
        }
    }

    var section: Int {
        return transactions.count
    }
    
    func row(section: Int) -> Int {
        return transactions[section].allPuts.count
    }
    
    func transaction(section: Int) -> TransactionsModel {
        return transactions[section]
    }

    func inOutPut(section: Int, row: Int) -> InOutPutModel {
        return transactions[section].allPuts[row]
    }
    
}
