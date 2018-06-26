//
//  RecordVC.swift
//  Bytom-Mobile-Wallet-iOS
//
//  Created by ldp on 2018/6/14.
//  Copyright © 2018年 曲终叶落. All rights reserved.
//

import UIKit

class RecordVC: UITableViewController {
    private let controller = IocContainer.resolve(RecordController.self)

    fileprivate lazy var dataSource: [TransactionsModel]? = [TransactionsModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource?.append(TransactionsModel())
        dataSource?.append(TransactionsModel())

        self.tableView.register(RecordSectionHeaderView.classForCoder(), forHeaderFooterViewReuseIdentifier: "RecordSectionHeaderView")
        self.tableView.tableFooterView = UIView()
        
        controller.bindInterface(interface: self)
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let headerView =   tableView.dequeueReusableHeaderFooterView(withIdentifier: "RecordSectionHeaderView") as! RecordSectionHeaderView
        headerView.recordModel = dataSource![section]
        headerView.expandCallBack = {
            (isExpanded: Bool) -> Void in
            tableView.reloadSections(NSIndexSet.init(index: section) as IndexSet, with: UITableViewRowAnimation.fade)
        }
        return headerView
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return controller.section
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 38
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (dataSource![section].isExpanded != false) ?  2: 0
        
//        return controller.transaction(section: section)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: RecordCell.ID, for: indexPath) as! RecordCell

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: true)
        
        let vc = R.storyboard.me.recordDetailVC()
        navigationController?.pushViewController(vc!, animated: true)
        
    }
}


extension RecordVC: RecordInterface {
    func reload() {
        tableView.reloadData()
    }
}

