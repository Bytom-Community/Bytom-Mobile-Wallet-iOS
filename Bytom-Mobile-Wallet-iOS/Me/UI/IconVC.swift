//
//  IconVC.swift
//  Bytom-Mobile-Wallet-iOS
//
//  Created by ldp on 2018/6/15.
//  Copyright © 2018年 曲终叶落. All rights reserved.
//

import UIKit

typealias selectResultClosure = (_ string:String)->Void

class IconVC: UITableViewController {

    fileprivate lazy var dataSource: [String] = ["美元 - USDT","人民币 - CNY","比特币 - BTC"]
    
    var selectValue: String = "美元 - USDT"

    var resultClosure: selectResultClosure?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let btn = UIButton.init(type: UIButtonType.custom)
        btn.setTitle("保存", for: UIControlState.normal)
        btn.setTitleColor(Colors.mainColor, for: UIControlState.normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        btn.addTarget(self, action: #selector(rightOnClick), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: btn)
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
        
        self.tableView.tableFooterView = UIView()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = (tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)) as UITableViewCell
        
        cell.textLabel?.font = UIFont.systemFont(ofSize: 15)
        cell.textLabel?.textColor = Colors.darkGreyColor
        cell.textLabel?.text = dataSource[indexPath.row]
        
        if selectValue == dataSource[indexPath.row] {
            cell.accessoryType = UITableViewCellAccessoryType.checkmark
        }else{
            cell.accessoryType = UITableViewCellAccessoryType.none
        }

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: true)
        
        selectValue = dataSource[indexPath.row]
        
        tableView.reloadData()

    }
    
    @objc func rightOnClick() {
        
        if resultClosure != nil {
            resultClosure!(selectValue)
        }
        
        self.navigationController?.popViewController(animated: true)
    }

    
    
}
