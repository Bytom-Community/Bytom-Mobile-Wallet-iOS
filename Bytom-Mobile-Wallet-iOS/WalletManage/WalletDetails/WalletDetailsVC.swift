//
//  WalletDetailsVC.swift
//  Bytom-Mobile-Wallet-iOS
//
//  Created by xhack on 2018/6/13.
//  Copyright © 2018年 曲终叶落. All rights reserved.
//

import UIKit

class WalletDetailsVC: UITableViewController {
    
    
    @IBOutlet weak var publicAddressLabel: UILabel!
    @IBOutlet weak var copyButton: UIButton!
    @IBOutlet weak var aliasLabel: UILabel!
    
    var dataSouce = AccountData()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        publicAddressLabel.text = dataSouce.defaultAddress
        aliasLabel.text = dataSouce.alias
    }
    
    
    enum CellClickType:Int {
        case copyAddress = 0, alias, changePassword, backupWallet
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        guard let cellClick = CellClickType(rawValue: indexPath.row) else {
            return
        }
        
        switch cellClick {
        case .copyAddress:
            
            UIPasteboard.general.string = publicAddressLabel.text
            self.showSuccessToast("复制成功")
            self.copyButton.isSelected = true
            
        case .alias:
            
            break
            
//            let alertVC = UIAlertController(title: nil, message: "请输入钱包别名", preferredStyle: .alert)
//            alertVC.addAction(UIAlertAction(title: "取消", style: .cancel, handler: nil))
//            alertVC.addTextField { $0.placeholder = "请输入钱包别名"}
//            alertVC.addAction(UIAlertAction(title: "确认", style: .destructive) { _ in
//                 let aliasText = alertVC.textFields!.first!.text ?? ""
//                 print(aliasText)
//            })
//            self.present(alertVC, animated: true, completion: nil)
            
        case .changePassword:
            
            let vc = R.storyboard.walletManage.changePasswordVC()
            vc?.dataSource = self.dataSouce
            navigationController?.pushViewController(vc!, animated: true)
        case .backupWallet:

            showErrorToast("暂不支持单个钱包备份")
//            let vc = R.storyboard.walletManage.backupWalletVC()
//            navigationController?.pushViewController(vc!, animated: true)
        }
    }
}
