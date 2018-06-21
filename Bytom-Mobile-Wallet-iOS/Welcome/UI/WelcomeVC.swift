//
//  WelcomeVC.swift
//  Bytom-Mobile-Wallet-iOS
//
//  Created by 曲终叶落 on 2018/6/11.
//  Copyright © 2018年 曲终叶落. All rights reserved.
//

import UIKit

class WelcomeVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        fd_prefersNavigationBarHidden = true
    }
    
    
    @IBAction func createClick(_ sender: UIButton) {
        let vc = R.storyboard.walletManage.createWalletVC()
        navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func importClick(_ sender: UIButton) {
        let vc = R.storyboard.walletManage.importWalletVC()
        navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func mainClick(_ sender: UIButton) {
        let mainTabBarVC = R.storyboard.main.mainTabBarController()
        UIApplication.shared.keyWindow?.rootViewController = mainTabBarVC
    }
}
