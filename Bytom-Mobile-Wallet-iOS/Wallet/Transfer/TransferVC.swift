//
//  TransferVC.swift
//  Bytom-Mobile-Wallet-iOS
//
//  Created by xhack on 2018/6/21.
//  Copyright © 2018年 曲终叶落. All rights reserved.
//

import UIKit

class TransferVC: UITableViewController {
    
    @IBOutlet weak var walletAddressTF: UITextField!
    @IBOutlet weak var numberTF: UITextField!
    @IBOutlet weak var remarkTF: UITextField!
    
    @IBOutlet weak var unitListView: UIView!
    @IBOutlet weak var unitListViewHeight: NSLayoutConstraint!

    @IBOutlet var gasTypeButtons: [UIButton]!
    @IBOutlet weak var unitButton: UIButton!
    
    @IBOutlet weak var customGasView: UIView!
    @IBOutlet weak var customGasNumberTF: UITextField!
    
    @IBOutlet weak var bottomView: UIView!
    
    var bottomViewCenterY:CGFloat {
        return tableView.bounds.height - bottomView.bounds.midY + tableView.contentOffset.y
    }
    
    enum GasType:Int {
        case standard = 0, fast, custom
    }
    
    enum UnitType:Int {
        case BTM = 0, mBTM, NEU
    }
    
    var selectedGasType:GasType = .standard
    var customGasUnit:UnitType = .BTM
    
    var isExpandedUnitList = false {
        didSet {
            switch isExpandedUnitList {
            case true:
                UIView.animate(withDuration: 0.39) {
                    self.unitListView.isHidden = false
                    self.unitListViewHeight.constant = 74
                    self.view.layoutIfNeeded()
                }
            case false:
                UIView.animate(withDuration: 0.3, animations: {
                    self.unitListViewHeight.constant = 0
                    self.view.layoutIfNeeded()
                }) { _ in
                    self.unitListView.isHidden = true
                }
            }
        }
    }
    
    var testAddress = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUIConfig()
        // test
        walletAddressTF.text = testAddress
    }
    
   private func initUIConfig() {
        customGasView.isHidden = true
        unitListView.isHidden = true
        unitListViewHeight.constant = 0
        gasTypeButtons.forEach { $0.isSelected = $0.tag == 0 }
        bottomView.alpha = 0
    }
    
    @IBAction func qrCodeScanClick(_ sender: UIBarButtonItem) {
        let vc = QRCodeScannerVC()
        vc.hidesBottomBarWhenPushed = true
        vc.resultClosure = { [weak self] address in
            self!.testAddress = address
            self!.walletAddressTF.text = address
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func gasTypeBtnsClick(_ sender: UIButton) {
        gasTypeButtons.forEach{ $0.isSelected = $0.tag == sender.tag }
        selectedGasType = GasType(rawValue: sender.tag)!
        switch selectedGasType {
        case .fast,.standard:
           customGasView.isHidden = true
           isExpandedUnitList = false
        case .custom:
           customGasView.isHidden = false
        }
    }
    
    @IBAction func unitBtnClick(_ sender: UIButton) {
        isExpandedUnitList = !isExpandedUnitList
    }
    
    @IBAction func unitListBtnsClick(_ sender: UIButton) {
        customGasUnit = UnitType(rawValue: sender.tag)!
        unitButton.setTitle(sender.titleLabel?.text, for: .normal)
        isExpandedUnitList = false
    }
    
    @IBAction func transferClick(_ sender: UIButton) {
        let alertVC = UIAlertController(title: nil, message: "请输入钱包密码", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "取消", style: .cancel, handler: nil))
        alertVC.addTextField { $0.placeholder = "请输入钱包密码"}
        alertVC.addAction(UIAlertAction(title: "确认", style: .destructive) { _ in
            let password = alertVC.textFields!.first!.text ?? ""
            print(password)
        })
        self.present(alertVC, animated: true, completion: nil)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        bottomView.center.y = bottomViewCenterY
        UIView.animate(withDuration: 0.32) {
             self.bottomView.alpha = 1
             self.view.layoutIfNeeded()
        }
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        bottomView.center.y = bottomViewCenterY
    }
    
    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        UIApplication.shared.keyWindow?.endEditing(true)
    }
}
