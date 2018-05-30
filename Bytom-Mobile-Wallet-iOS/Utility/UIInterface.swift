//
//  UIInterface.swift
//  Bytom-Mobile-Wallet-iOS
//
//  Created by 曲终叶落 on 2018/5/29.
//  Copyright © 2018年 曲终叶落. All rights reserved.
//

import Foundation

protocol UIInterface: class {
    func alertNetworkError()
    func toast(_ string: String)
    func showActivityIndicator()
    func hideActivityIndicator()
    func openBrowserVC(title: String?, url: URL)
}
