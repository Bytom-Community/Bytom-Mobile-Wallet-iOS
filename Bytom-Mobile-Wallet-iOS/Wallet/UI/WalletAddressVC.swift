//
//  WalletAddressVC.swift
//  Bytom-Mobile-Wallet-iOS
//
//  Created by xhack on 2018/6/21.
//  Copyright © 2018年 曲终叶落. All rights reserved.
//

import UIKit
import swiftScan

class WalletAddressVC: UIViewController {
    
    public var address = ""
    
    @IBOutlet weak var qrCodeImageView: UIImageView!{
        didSet {
            let size = CGSize(width: qrCodeImageView.frame.width, height: qrCodeImageView.frame.height)
            let qrImage = LBXScanWrapper.createCode(codeType: "CIQRCodeGenerator", codeString: address, size: size, qrColor: .black, bkColor: .white)
            qrCodeImageView.image = qrImage
        }
    }
    
    @IBOutlet weak var addressLabel: UILabel! {
        didSet {
            addressLabel.text = address
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func copyClick(_ sender: UIButton) {
        UIPasteboard.general.string = address
        self.showSuccessToast("复制成功") {
            sender.isSelected = true
        }
    }
}
