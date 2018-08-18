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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    @IBAction func createWalletClick(_ sender: UIButton) {
        let vc = R.storyboard.walletManage.createWalletVC()
        navigationController?.pushViewController(vc!, animated: true)
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
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: WalletManageCell.ID) as! WalletManageCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer {
            tableView.deselectRow(at: indexPath, animated: true)
        }
        let vc = R.storyboard.walletManage.walletDetailsVC()
        navigationController?.pushViewController(vc!, animated: true)
    }
}
