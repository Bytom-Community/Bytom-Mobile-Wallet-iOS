//
//  MeHeaderView.swift
//  Bytom-Mobile-Wallet-iOS
//
//  Created by ldp on 2018/6/11.
//  Copyright © 2018年 曲终叶落. All rights reserved.
//

import UIKit
import SnapKit

class MeHeaderView: UIView {
   
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setupUI()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func setupUI(){
        
        let walletBtn = viewWithTag(1000) as! UIButton
        let recordBtn = viewWithTag(2000) as! UIButton

        walletBtn.set(image: R.image.wallet_white(), title: "钱包", titlePosition: UIViewContentMode.bottom, additionalSpacing: 16, state: UIControlState.normal)
        walletBtn.setTitleColor(UIColor.white, for: UIControlState.normal)
        walletBtn.titleLabel?.font = UIFont.systemFont(ofSize: 17)

        recordBtn.set(image: R.image.record(), title: "交易记录", titlePosition: UIViewContentMode.bottom, additionalSpacing: 16, state: UIControlState.normal)
        recordBtn.setTitleColor(UIColor.white, for: UIControlState.normal)
        recordBtn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
    }
}

extension UIButton {
    
    @objc func set(image anImage: UIImage?, title: String,
                   titlePosition: UIViewContentMode, additionalSpacing: CGFloat, state: UIControlState){
        self.imageView?.contentMode = .center
        self.setImage(anImage, for: state)
        
        positionLabelRespectToImage(title: title, position: titlePosition, spacing: additionalSpacing)
        
        self.titleLabel?.contentMode = .center
        self.setTitle(title, for: state)
    }
    
    private func positionLabelRespectToImage(title: String, position: UIViewContentMode,
                                             spacing: CGFloat) {
        let imageSize = self.imageRect(forContentRect: self.frame)
        let titleFont = self.titleLabel?.font!
        let titleSize = title.size(withAttributes: [kCTFontAttributeName as NSAttributedStringKey: titleFont!])
        
        var titleInsets: UIEdgeInsets
        var imageInsets: UIEdgeInsets
        
        switch (position){
        case .top:
            titleInsets = UIEdgeInsets(top: -(imageSize.height + titleSize.height + spacing),
                                       left: -(imageSize.width), bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -titleSize.width)
        case .bottom:
            titleInsets = UIEdgeInsets(top: (imageSize.height + titleSize.height + spacing),
                                       left: -(imageSize.width), bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -titleSize.width)
        case .left:
            titleInsets = UIEdgeInsets(top: 0, left: -(imageSize.width * 2), bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0,
                                       right: -(titleSize.width * 2 + spacing))
        case .right:
            titleInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -spacing)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        default:
            titleInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        
        self.titleEdgeInsets = titleInsets
        self.imageEdgeInsets = imageInsets
    }
}
