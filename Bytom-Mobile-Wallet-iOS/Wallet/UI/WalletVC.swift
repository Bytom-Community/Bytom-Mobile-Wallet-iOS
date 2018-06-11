//
//  WalletVC.swift
//  Bytom-Mobile-Wallet-iOS
//
//  Created by 曲终叶落 on 2018/5/30.
//  Copyright © 2018年 曲终叶落. All rights reserved.
//

import UIKit
import WebKit

class WalletVC: UIViewController {
    private let controller = IocContainer.resolve(WalletController.self)

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        fd_prefersNavigationBarHidden = true

        let statusBarBackgroundView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: view.bounds.width, height: UIApplication.shared.statusBarFrame.height))
        statusBarBackgroundView.backgroundColor = Colors.backgroundColor
        view.addSubview(statusBarBackgroundView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        UIApplication.shared.statusBarStyle = .default
    }
}

extension WalletVC: WalletInteface {
    func reloadWebView(html: String) {

    }
}
