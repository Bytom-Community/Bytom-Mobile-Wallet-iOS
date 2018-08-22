//
//  WalletVC.swift
//  Bytom-Mobile-Wallet-iOS
//
//  Created by 曲终叶落 on 2018/5/30.
//  Copyright © 2018年 曲终叶落. All rights reserved.
//

import UIKit
import WebKit

class WalletVC: UIViewController {
    private let presenter = IocContainer.resolve(WalletPresenter.self)
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var aliasLb: UILabel!
    @IBOutlet weak var addressLb:  UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        fd_prefersNavigationBarHidden = true

        let statusBarBackgroundView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: view.bounds.width, height: UIApplication.shared.statusBarFrame.height))
        statusBarBackgroundView.backgroundColor = Colors.backgroundColor
        view.addSubview(statusBarBackgroundView)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        presenter.bindInterface(interface: self)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UIApplication.shared.statusBarStyle = .default
    }
    
    @IBAction func memuClick(_ sender: UIButton) {
        let rootVC = UIApplication.shared.keyWindow?.rootViewController
        let vc = R.storyboard.wallet.switchWalletVC()
        vc?.modalPresentationStyle = .overCurrentContext
        rootVC?.definesPresentationContext = true
        rootVC?.present(vc!, animated: false, completion: nil)
        
        vc?.callBack = { click in
            switch click {
            case .selectedWallet(let account):
                BytomWallet.shared.currentAccount = account
                Config.setSelectedAccount(alias: account.alias)
                self.presenter.refreshPage()
            case .createWallet:
                let vc = R.storyboard.walletManage.createWalletVC()
                self.navigationController?.pushViewController(vc!, animated: true)
            case .importWallet:
                let vc = R.storyboard.walletManage.importWalletVC()
                self.navigationController?.pushViewController(vc!, animated: true)
            }
        }
    }
    
    @IBAction func addressClick(_ sender: UIButton) {
        let vc = R.storyboard.wallet.walletAddressVC()!
        vc.address = BytomWallet.shared.currentAccount!.defaultAddress
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func qrCodeScanClick(_ sender: UIButton) {
        let vc = QRCodeScannerVC()
        vc.hidesBottomBarWhenPushed = true
        vc.resultClosure = { [weak self] address in
            print(address)
            // TODO: -
            let vc = R.storyboard.wallet.transferVC()!
            vc.testAddress = address
            self!.navigationController?.pushViewController(vc, animated: true)
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func transferClick(_ sender: UIButton) {
        let vc = R.storyboard.wallet.transferVC()
        navigationController?.pushViewController(vc!, animated: true)
    }
}

extension WalletVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.row
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TokenCell.ID, for: indexPath) as! TokenCell
        cell.asset = presenter.asset(row: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(presenter.asset(row: indexPath.row))
    }
}

extension WalletVC: WalletInteface {
    
    func reload() {
        aliasLb.text = BytomWallet.shared.currentAccount!.alias
        addressLb.text = BytomWallet.shared.currentAccount!.defaultAddress
        tableView.reloadData()
    }
}




