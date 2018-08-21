//
//  BackupWalletVC.swift
//  Bytom-Mobile-Wallet-iOS
//
//  Created by xhack on 2018/6/13.
//  Copyright © 2018年 曲终叶落. All rights reserved.
//

import UIKit

class BackupWalletVC: UITableViewController {
    
    @IBOutlet weak var keystoreTextView: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        keystoreTextView.text = WalletManageRepository.getWalletBackupWalletImage()
    }
    
    @IBAction func copyClick(_ sender: UIButton) {
        
        UIPasteboard.general.string = keystoreTextView.text
        self.showSuccessToast("复制成功")
        sender.isSelected = true
    }
}

