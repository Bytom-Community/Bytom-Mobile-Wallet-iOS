//
//  ChangePasswordVC.swift
//  Bytom-Mobile-Wallet-iOS
//
//  Created by xhack on 2018/6/13.
//  Copyright © 2018年 曲终叶落. All rights reserved.
//

import UIKit

class ChangePasswordVC: UIViewController {
    
    @IBOutlet weak var oldPasswordTF: UITextField!
    @IBOutlet weak var newPasswordTF: UITextField!
    @IBOutlet weak var confirmPasswordTF: UITextField!
    
    var dataSource = WalletManageData()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func cancelClick(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func confirmClick(_ sender: UIButton) {
        
        let oldPassword = oldPasswordTF.text!
        let newPassword = newPasswordTF.text!
        let confirmPassword = confirmPasswordTF.text!
        guard !newPassword.isEmpty else { return showSuccessToast("新密码不能为空") }
        guard newPassword == confirmPassword else { return showSuccessToast("新密码与确认密码不相同") }
        
        let res = WalletManageRepository.changePassword(dataSource.rootXPub, oldPassword: oldPassword, newPassword: newPassword)
        switch res {
        case .fail(let errorMsg):
            showErrorToast(errorMsg)
        case .success:
            showSuccessToast("修改成功") {
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
}









