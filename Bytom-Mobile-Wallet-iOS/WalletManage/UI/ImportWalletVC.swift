//
//  ImportWalletVC.swift
//  Bytom-Mobile-Wallet-iOS
//
//  Created by xhack on 2018/6/13.
//  Copyright © 2018年 曲终叶落. All rights reserved.
//

import UIKit

class ImportWalletVC: UITableViewController {
    
    @IBOutlet weak var keystoreTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func importWalletClick(_ sender: UIButton) {
        // TODO: - 
        self.showSuccessToast("成功导入") {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    deinit {
        print("释放")
    }
}

