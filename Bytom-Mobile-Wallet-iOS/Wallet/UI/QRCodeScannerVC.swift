//
//  QRCodeScannerVC.swift
//  Bytom-Mobile-Wallet-iOS
//
//  Created by xhack on 2018/6/21.
//  Copyright © 2018年 曲终叶落. All rights reserved.
//

import UIKit
import swiftScan

typealias QRCodeScannerVCCallBack = (_ address:String) -> ()
class QRCodeScannerVC: LBXScanViewController {
    
    lazy var barButtonItem:UIBarButtonItem = {
        let btn = UIButton(type: .custom)
        btn.setTitle("从相册选取", for: .normal)
        btn.setTitleColor(Colors.mainColor, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        btn.addTarget(self, action: #selector(openLocalPhotoAlbum), for: .touchUpInside)
        return UIBarButtonItem(customView: btn)
    }()
    
    lazy var customStyle:LBXScanViewStyle = {
        var style = LBXScanViewStyle()
        style.centerUpOffset = 44
        style.photoframeAngleStyle = LBXScanViewPhotoframeAngleStyle.Inner
        style.photoframeLineW = 2
        style.photoframeAngleW = 18
        style.photoframeAngleH = 18
        style.isNeedShowRetangle = false
        style.anmiationStyle = LBXScanViewAnimationStyle.LineMove
        style.colorAngle = Colors.mainColor
        style.animationImage = R.image.qrcode_scan_line()
        return style
    }()
    
    
    var resultClosure: QRCodeScannerVCCallBack?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "扫一扫"
        navigationItem.rightBarButtonItem = barButtonItem
        scanStyle = customStyle
    }
    
    
    @objc func openLocalPhotoAlbum(){
        self.openPhotoAlbum()
    }
    
    override func handleCodeResult(arrayResult: [LBXScanResult]) {
        
        guard let result = arrayResult.first?.strScanned else { return }
        
        // TODO: - verify Address
        let verifyAddress = result.hasPrefix("bm")
        
        guard verifyAddress == true else {
            
            let alertVC = UIAlertController(title: "交易账户无效", message: result, preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "知道了", style: .default) { [weak self] _ in
                self!.startScan()
            })
            self.present(alertVC, animated: true, completion: nil)
            return
        }
        
        self.navigationController?.popViewController(animated: false)
        self.resultClosure?(result)
    }
}










