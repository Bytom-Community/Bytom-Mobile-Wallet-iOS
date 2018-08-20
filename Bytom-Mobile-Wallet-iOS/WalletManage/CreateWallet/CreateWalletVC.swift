//
//  CreateWalletVC.swift
//  Bytom-Mobile-Wallet-iOS
//
//  Created by xhack on 2018/6/13.
//  Copyright © 2018年 曲终叶落. All rights reserved.
//

import UIKit

typealias CreateWalletVCCallBack = () -> ()
class CreateWalletVC: UITableViewController {
    
    
    @IBOutlet weak var aliasTF: UITextField!
    @IBOutlet weak var walletPasswordTF: UITextField!
    @IBOutlet weak var confirmPasswordTF: UITextField!
    
    var callBack:CreateWalletVCCallBack?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    
    @IBAction func createClick(_ sender: UIButton) {
        
        let alias = aliasTF.text!
        let password = walletPasswordTF.text!
        let confirmPassword = confirmPasswordTF.text!
        
        guard !alias.isEmpty else { return showSuccessToast("别名不能为空") }
        guard !password.isEmpty else { return showSuccessToast("密码不能为空") }
        guard !confirmPassword.isEmpty else { return showSuccessToast("确认密码不能为空") }
        guard password == confirmPassword else { return showSuccessToast("密码与确认密码不相同") }
        
        
        
        let res = WalletManageRepository.createWallet(alias: alias, password: password)
        
        switch res {
        case .fail(let error):
            showErrorToast(error)
        case .success:
            showSuccessToast("创建成功") { [weak self] in
                self!.navigationController?.popViewController(animated: true)
                self!.callBack?()
            }
        }
        

    }
    
    
    
    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        UIApplication.shared.keyWindow?.endEditing(true)
    }
}
