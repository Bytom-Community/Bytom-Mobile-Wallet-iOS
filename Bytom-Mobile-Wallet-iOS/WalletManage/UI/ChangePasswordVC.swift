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
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func cancelClick(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func confirmClick(_ sender: UIButton) {
        print("confirmClick")
    }
}
