//
//  ImportWalletVC.swift
//  Bytom-Mobile-Wallet-iOS
//
//  Created by xhack on 2018/6/13.
//  Copyright © 2018年 曲终叶落. All rights reserved.
//

import UIKit

typealias ImportWalletVCCallBack = () -> ()
class ImportWalletVC: UITableViewController {
    
    @IBOutlet weak var keystoreTextView: UITextView!
    
    var callBack:ImportWalletVCCallBack?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func importWalletClick(_ sender: UIButton) {
        
        let res = WalletManageRepository.walletRestore(walletImage: keystoreTextView.text)
        // TODO: -
        switch res {
        case .fail(let errorMsg):
            showErrorToast(errorMsg)
        case .success:
            self.showSuccessToast("成功导入") {
                self.navigationController?.popViewController(animated: true)
                self.callBack?()
            }
        }
    }
}

