//
//  Engine.swift
//  Bytom-Mobile-Wallet-iOS
//
//  Created by 曲终叶落 on 2018/5/30.
//  Copyright © 2018年 曲终叶落. All rights reserved.
//

import Foundation
import IQKeyboardManagerSwift

class Engine {
    static let instance = Engine()
    
    func start() {
        IocContainer.registerAll()
        thirdParty()
        setUI()
    }
    
    private func setUI() {
        UINavigationBar.appearance().tintColor = Colors.indicateColor
        UINavigationBar.appearance().barTintColor = Colors.whiteColor
        UINavigationBar.appearance().titleTextAttributes = [
            NSAttributedStringKey.foregroundColor: Colors.blackColor
        ]
        UIBarButtonItem.appearance().setTitleTextAttributes([
            NSAttributedStringKey.foregroundColor: UIColor.clear
            ], for: .normal)
        UIBarButtonItem.appearance().setTitleTextAttributes([
            NSAttributedStringKey.foregroundColor: UIColor.clear
            ], for: .highlighted)
        UITabBar.appearance().barTintColor = Colors.whiteColor
        UITabBar.appearance().tintColor = Colors.mainColor
        
        UITextField.appearance().tintColor = Colors.indicateColor
        UITextView.appearance().tintColor = Colors.indicateColor
    }
    
    private func thirdParty() {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableAutoToolbar = false
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
    }
}
