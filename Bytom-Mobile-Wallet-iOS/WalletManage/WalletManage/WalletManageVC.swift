//
//  WalletManageVC.swift
//  Bytom-Mobile-Wallet-iOS
//
//  Created by xhack on 2018/6/13.
//  Copyright © 2018年 曲终叶落. All rights reserved.
//

import UIKit

class WalletManageVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.tableFooterView = UIView()
        }
    }
    
    var dataSoucre = [WalletManageData]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reload()
    }
    
    func reload() {
        dataSoucre = WalletManageRepository.getWalletAccountList()
    }
    
    @IBAction func backupWalletClick(_ sender: UIBarButtonItem) {
        let vc = R.storyboard.walletManage.backupWalletVC()
        navigationController?.pushViewController(vc!, animated: true)
    }
    
    
    @IBAction func createWalletClick(_ sender: UIButton) {
        let vc = R.storyboard.walletManage.createWalletVC()
        navigationController?.pushViewController(vc!, animated: true)
        vc?.callBack = { [weak self] in
            self!.reload()
        }
    }
    
    @IBAction func importWalletClick(_ sender: UIButton) {
        let vc = R.storyboard.walletManage.importWalletVC()
        navigationController?.pushViewController(vc!, animated: true)
    }
}

extension WalletManageVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSoucre.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: WalletManageCell.ID) as! WalletManageCell
        cell.aliasLb.text = dataSoucre[indexPath.row].alias
        cell.addressLb.text = dataSoucre[indexPath.row].defaultAddress
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer {
            tableView.deselectRow(at: indexPath, animated: true)
        }
        let vc = R.storyboard.walletManage.walletDetailsVC()
        vc?.dataSouce = self.dataSoucre[indexPath.row]
        navigationController?.pushViewController(vc!, animated: true)
    }
}
