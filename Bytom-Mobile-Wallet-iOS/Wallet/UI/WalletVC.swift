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
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView = WKWebView(frame: self.view.bounds, configuration: WKWebViewConfiguration())
        view.addSubview(webView)
        // 模拟一个网络请求
        controller.bindInterface(interface: self)
    }
}

extension WalletVC: WalletInteface {
    func reloadWebView(html: String) {
        webView.loadHTMLString(html, baseURL: nil)
    }
}
