//
//  MeVC.swift
//  Bytom-Mobile-Wallet-iOS
//
//  Created by ldp on 2018/6/11.
//  Copyright © 2018年 曲终叶落. All rights reserved.
//

import UIKit
import DeviceKit
class MeVC: UITableViewController {
    @IBOutlet weak var nodeLB: UILabel!
    @IBOutlet weak var iconLB: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        fd_prefersNavigationBarHidden = true

        setStatusBarBg()
       
        self.tableView.tableFooterView = UIView()

        self.nodeLB.text = Config.selectedNode()
        self.iconLB.text = Config.selectedCoin()
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
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    func setStatusBarBg() {
        let statusBarBackgroundView = UIView(frame: CGRect.init(x: 0, y: -UIApplication.shared.statusBarFrame.height, width: view.bounds.width, height: UIApplication.shared.statusBarFrame.height))
        statusBarBackgroundView.backgroundColor = Colors.backgroundColor
        view.addSubview(statusBarBackgroundView)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: true)
        
        switch indexPath.row {
        case 0:
            let vc = R.storyboard.me.nodeVC()
            vc?.resultClosure = {(_ string:String)->Void in
                Config.setSelectedNode(node: string)
               self.nodeLB.text = string
            }
            navigationController?.pushViewController(vc!, animated: true)
            break
        case 1:
            let vc = R.storyboard.me.iconVC()
            vc?.resultClosure = {(_ string:String)->Void in
                Config.setSelectedCoin(coin: string)
                self.iconLB.text = string
            }
            navigationController?.pushViewController(vc!, animated: true)
            break
        case 2:
           
            let vc = R.storyboard.walletManage.backupWalletVC()
            navigationController?.pushViewController(vc!, animated: true)

            break
        case 3:

            let activityViewController = UIActivityViewController(
                activityItems: ["https://bytom.io/"],
                applicationActivities: nil)
//            activityViewController.excludedActivityTypes =  [
//                UIActivityType.postToTwitter,
//                UIActivityType.postToFacebook,
//                UIActivityType.postToWeibo,
//                UIActivityType.message,
//                UIActivityType.mail,
//                UIActivityType.print,
//                UIActivityType.copyToPasteboard,
//                UIActivityType.assignToContact,
//                UIActivityType.saveToCameraRoll,
//                UIActivityType.addToReadingList,
//                UIActivityType.postToFlickr,
//                UIActivityType.postToVimeo,
//                UIActivityType.postToTencentWeibo
//            ]
            if Device().isPad {
                if let popOver = activityViewController.popoverPresentationController {
                    popOver.sourceView = tableView.cellForRow(at: indexPath)
                    popOver.permittedArrowDirections = .up
                }
            }
            self.navigationController?.present(activityViewController,
                                                            animated: true,
                                                            completion: nil)
            break
        case 4:
            
            break
        default:
            break
        }
    }
    
    
    @IBAction func recordOnClick(_ sender: UIButton) {
        let vc = R.storyboard.me.recordVC()
        navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func walletOnClick(_ sender: UIButton) {
        let vc = R.storyboard.walletManage.walletManageVC()
        navigationController?.pushViewController(vc!, animated: true)
    }
}


