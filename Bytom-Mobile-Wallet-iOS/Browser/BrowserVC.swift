//
//  BrowserVC.swift
//  Bytom-Mobile-Wallet-iOS
//
//  Created by 曲终叶落 on 2018/5/29.
//  Copyright © 2018年 曲终叶落. All rights reserved.
//

import UIKit
import WebKit

class BrowserVC: UIViewController {
    var url:URL?
    var webView : WKWebView!
    var loadProgress = UIProgressView()
    let estimatedProgress = "estimatedProgress"
    
    init(title: String?, url: URL) {
        super.init(nibName: nil, bundle: nil)
        self.title = title
        self.url = url
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addWebView()
        addProgressView()
    }
    
    private func addWebView() {
        let pref = WKPreferences()
        pref.javaScriptEnabled = true
        pref.minimumFontSize = 18
        let config = WKWebViewConfiguration()
        config.preferences = pref
        webView = WKWebView(frame: view.bounds, configuration: config)
        webView.uiDelegate = self
        webView.navigationDelegate = self
        view.addSubview(webView)
        
        if let newUrl = self.url {
            let request = URLRequest(url: newUrl)
            webView.load(request as URLRequest)
        }
        webView.addObserver(self, forKeyPath: estimatedProgress, options: .new, context: nil)
    }
    
    private func addProgressView(){
        let y = (self.navigationController?.navigationBar.frame.height)! + UIApplication.shared.statusBarFrame.height
        loadProgress.frame = CGRect(x: 0, y: y, width: self.view.frame.size.width, height: 6)
        loadProgress.progress = 0
        loadProgress.progressTintColor = UIColor(red:5/255,green:159/255,blue:148/255,alpha:1.0)
        loadProgress.trackTintColor = UIColor.gray
        view.addSubview(loadProgress)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if (keyPath == estimatedProgress) {
            loadProgress.isHidden = webView.estimatedProgress == 1
            loadProgress.setProgress(Float(webView.estimatedProgress), animated: true)
            loadProgress.progressTintColor = Colors.blue
            loadProgress.trackTintColor = UIColor.gray
        }
    }
    
    deinit{
        webView.removeObserver(self, forKeyPath: estimatedProgress)
    }
}

extension BrowserVC: WKUIDelegate, WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        if self.title == nil || self.title!.isEmpty {
            self.title = webView.title
        }
        loadProgress.setProgress(0.0, animated: true)
    }
}
