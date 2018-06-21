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
    private let controller = IocContainer.resolve(WalletController.self)
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        fd_prefersNavigationBarHidden = true

        let statusBarBackgroundView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: view.bounds.width, height: UIApplication.shared.statusBarFrame.height))
        statusBarBackgroundView.backgroundColor = Colors.backgroundColor
        view.addSubview(statusBarBackgroundView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        controller.bindInterface(interface: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        UIApplication.shared.statusBarStyle = .default
    }
    
    @IBAction func memuClick(_ sender: UIButton) {
        let rootVC = UIApplication.shared.keyWindow?.rootViewController
        let vc = R.storyboard.wallet.switchWalletVC()
        vc?.modalPresentationStyle = .overCurrentContext
        rootVC?.definesPresentationContext = true
        rootVC?.present(vc!, animated: false, completion: nil)
    }
    
    @IBAction func addressClick(_ sender: UIButton) {
        let vc = R.storyboard.wallet.walletAddressVC()!
        vc.address = "bm57527c69a5587b45176265268d0f8c5958411d56"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func qrCodeScanClick(_ sender: UIButton) {
        let vc = QRCodeScannerVC()
        vc.hidesBottomBarWhenPushed = true
        vc.resultClosure = { address in
            print(address)
            // TODO: - push转账页面
            
        }
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension WalletVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controller.row
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TokenCell.ID, for: indexPath) as! TokenCell
        cell.asset = controller.asset(row: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(controller.asset(row: indexPath.row))
    }
}

extension WalletVC: WalletInteface {
    func reload() {
        tableView.reloadData()
    }
}
