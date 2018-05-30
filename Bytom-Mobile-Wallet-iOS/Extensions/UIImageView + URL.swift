//
//  UIImageView + URL.swift
//  Bytom-Mobile-Wallet-iOS
//
//  Created by 曲终叶落 on 2018/5/30.
//  Copyright © 2018年 曲终叶落. All rights reserved.
//

import Foundation
import Kingfisher

extension UIImageView {
    var url: String {
        get {
            return ""
        }
        set(value) {
            if value.hasPrefix("http://") || value.hasPrefix("https://") {
                self.kf.setImage(with: URL(string: value))
            }
        }
    }
}
