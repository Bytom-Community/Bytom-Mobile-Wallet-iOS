//
//  RecordVC.swift
//  Bytom-Mobile-Wallet-iOS
//
//  Created by ldp on 2018/6/14.
//  Copyright © 2018年 曲终叶落. All rights reserved.
//

import UIKit

import MJRefresh

class RecordVC: UITableViewController {
    private let controller = IocContainer.resolve(RecordPresenter.self)

//    fileprivate lazy var dataSource: [TransactionsModel]? = [TransactionsModel]()
    
    let header = MJRefreshNormalHeader()
    let footer = MJRefreshAutoNormalFooter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(RecordSectionHeaderView.classForCoder(), forHeaderFooterViewReuseIdentifier: "RecordSectionHeaderView")
        self.tableView.tableFooterView = UIView()
        
        initRefresh()
        
        controller.bindInterface(interface: self)
    }
    
    func initRefresh() {
        header.setRefreshingTarget(self, refreshingAction: #selector(headerRefresh))
        self.tableView.mj_header = header
        
        footer.setRefreshingTarget(self, refreshingAction: #selector(footerRefresh))
        self.tableView.mj_footer = footer
    }
    
    @objc func headerRefresh(){
        self.controller.headerRefresh()
    }
    
    @objc func footerRefresh(){
        self.controller.footerRefresh()
    }
   
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "RecordSectionHeaderView") as! RecordSectionHeaderView
        headerView.recordModel = controller.record(section: section)
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
        return (controller.record(section: section).isExpanded != false) ?  controller.row(section: section): 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: RecordCell.ID, for: indexPath) as! RecordCell

        cell.transaction = controller.transaction(section: indexPath.section, row: indexPath.row)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: true)
        
        let vc = R.storyboard.me.recordDetailVC()
        vc?.transaction = controller.transaction(section: indexPath.section, row: indexPath.row)
        navigationController?.pushViewController(vc!, animated: true)
        
    }
}


extension RecordVC: RecordInterface {
    func reload() {
        tableView.reloadData()
    }
    
    func endRefresh() {
        self.tableView.mj_header.endRefreshing()
        self.tableView.mj_footer.endRefreshing()
    }
}

