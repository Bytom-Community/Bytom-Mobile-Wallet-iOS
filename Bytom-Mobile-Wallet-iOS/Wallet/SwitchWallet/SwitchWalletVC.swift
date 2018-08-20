//
//  SwitchWalletVC.swift
//  Bytom-Mobile-Wallet-iOS
//
//  Created by 曲终叶落 on 2018/6/12.
//  Copyright © 2018年 曲终叶落. All rights reserved.
//

import UIKit

enum SwitchWalletClick {
    case selectedWallet(Int) // TODO: -
    case createWallet
    case importWallet
}

typealias SwitchWalletVCCallBack = (SwitchWalletClick)->()
class SwitchWalletVC: UIViewController {
    @IBOutlet weak var switchView: UIView!
    @IBOutlet weak var switchViewTrailing: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    
    var callBack:SwitchWalletVCCallBack?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = Colors.backgroundColor.withAlphaComponent(0.3)
        self.switchViewTrailing.constant = 200
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    lazy var walletAccountList:[WalletManageData] = {
        return WalletManageRepository.getWalletAccountList()
    }()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.switchViewTrailing.constant = 0
        UIView.animate(withDuration: 0.4) {
            self.view.layoutIfNeeded()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func dissClick(_ sender: Any) {
        close()
    }
    
    private func close() {
        self.switchViewTrailing.constant = 200
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
        }) { _ in
            self.dismiss(animated: false, completion: nil)
        }
    }
}

extension SwitchWalletVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? walletAccountList.count : 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //let titles = WalletManageRepository.getWalletAccountList().map { $0.alias }
        let cell = tableView.dequeueReusableCell(withIdentifier: SwitchWalletCell.ID) as! SwitchWalletCell
        cell.titleLb.textColor = Colors.whiteColor
        
        switch indexPath.section {
        case 0:
             cell.titleLb.text = walletAccountList[indexPath.row].alias
             cell.titleLb.textColor = indexPath.row == 0 ? Colors.mainColor : Colors.whiteColor
             cell.lineView.isHidden = indexPath.row != walletAccountList.count-1
        case 1:
             cell.titleLb.text = ["创建钱包","导入钱包"][indexPath.row]
             cell.lineView.isHidden = true
        default:
            return UITableViewCell()
        }
        //let titles = ["私房钱","小金库","零钱包","创建钱包","导入钱包"]
//        let cell = tableView.dequeueReusableCell(withIdentifier: SwitchWalletCell.ID) as! SwitchWalletCell
//        cell.titleLb.text = titles[indexPath.row]
//        cell.titleLb.textColor = Colors.whiteColor
//        if indexPath.row == 0 {
//            cell.titleLb.textColor = Colors.mainColor
//        }
//
//        if indexPath.row == 2 {
//            cell.lineView.isHidden = false
//        }else{
//            cell.lineView.isHidden = true
//        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        switch (indexPath.section, indexPath.row) {
        case (0,_):
            self.callBack?(SwitchWalletClick.selectedWallet(indexPath.row))
        case (1,0):
            self.callBack?(SwitchWalletClick.createWallet)
        case (1,1):
            self.callBack?(SwitchWalletClick.importWallet)
        default:
            break
        }
        close()
    }
}





