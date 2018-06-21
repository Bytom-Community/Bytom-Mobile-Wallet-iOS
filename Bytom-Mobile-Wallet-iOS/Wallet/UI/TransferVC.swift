//
//  TransferVC.swift
//  Bytom-Mobile-Wallet-iOS
//
//  Created by xhack on 2018/6/21.
//  Copyright © 2018年 曲终叶落. All rights reserved.
//

import UIKit

class TransferVC: UITableViewController {
    
    
    @IBOutlet weak var unitListView: UIView!
    @IBOutlet weak var unitListViewHeight: NSLayoutConstraint!

    @IBOutlet var gasTypeButtons: [UIButton]!
    @IBOutlet weak var unitButton: UIButton!
    
    @IBOutlet weak var customGasView: UIView!
    @IBOutlet weak var customGasNumberTF: UITextField!
    
    
    @IBOutlet weak var walletAddressTF: UITextField!
    @IBOutlet weak var numberTF: UITextField!
    @IBOutlet weak var remarkTF: UITextField!
    
    
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
                UIView.animate(withDuration: 0.5) {
                    self.unitListView.isHidden = false
                    self.unitListViewHeight.constant = 74
                    self.view.layoutIfNeeded()
                }
            case false:
                UIView.animate(withDuration: 0.5) {
                    self.unitListView.isHidden = true
                    self.unitListViewHeight.constant = 0
                    self.view.layoutIfNeeded()
                }
            }
        }
    }
    
    var testAddress = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customGasView.isHidden = true
        unitListView.isHidden = true
        unitListViewHeight.constant = 0
        gasTypeButtons.forEach { $0.isSelected = $0.tag == 0 }
        walletAddressTF.text = testAddress
        
        // TODO: - 扫描按钮、转账按钮
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
    
    
    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        UIApplication.shared.keyWindow?.endEditing(true)
    }
}
