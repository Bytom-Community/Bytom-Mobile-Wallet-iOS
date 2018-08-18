//
//  CreateWalletVC.swift
//  Bytom-Mobile-Wallet-iOS
//
//  Created by xhack on 2018/6/13.
//  Copyright © 2018年 曲终叶落. All rights reserved.
//

import UIKit

class CreateWalletVC: UITableViewController {
    
    
    @IBOutlet weak var aliasTF: UITextField!
    @IBOutlet weak var walletPasswordTF: UITextField!
    @IBOutlet weak var confirmPasswordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func createClick(_ sender: UIButton) {
        self.showSuccessToast("创建成功") { [weak self] in
           self!.navigationController?.popViewController(animated: true)
        }
    }
    
    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        UIApplication.shared.keyWindow?.endEditing(true)
    }
}
