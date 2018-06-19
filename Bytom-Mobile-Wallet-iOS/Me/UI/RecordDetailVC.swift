//
//  RecordDetailVC.swift
//  Bytom-Mobile-Wallet-iOS
//
//  Created by ldp on 2018/6/15.
//  Copyright © 2018年 曲终叶落. All rights reserved.
//

import UIKit

class RecordDetailVC: UITableViewController {

    fileprivate lazy var dataSource: [String] = ["交易状态","发送方","接收方","矿工费","备注","交易号","时间"]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.tableFooterView = UIView()
        self.tableView.estimatedRowHeight = 60
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataSource.count
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecordDetailCellID", for: indexPath) as UITableViewCell
        
        let titleLB = cell.viewWithTag(1000) as! UILabel
        let contentLB = cell.viewWithTag(2000) as! UILabel
        
        titleLB.text = dataSource[indexPath.row]
        contentLB.text = "bmsdafasdffsadfsdafsadsafsadfsadfsdafsd"
        
        return cell
    }
}
