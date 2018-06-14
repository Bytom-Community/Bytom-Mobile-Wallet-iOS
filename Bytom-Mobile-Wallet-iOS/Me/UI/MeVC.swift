//
//  MeVC.swift
//  Bytom-Mobile-Wallet-iOS
//
//  Created by ldp on 2018/6/11.
//  Copyright © 2018年 曲终叶落. All rights reserved.
//

import UIKit

class MeVC: UITableViewController {
    
    @IBOutlet weak var nodeLB: UILabel!
    @IBOutlet weak var iconLB: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fd_prefersNavigationBarHidden = true

        setStatusBarBg()
       
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        super.viewWillAppear(animated)
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        super.viewWillDisappear(animated)
        UIApplication.shared.statusBarStyle = .default
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    func setStatusBarBg() {
        let statusBarBackgroundView = UIView.init(frame: CGRect.init(x: 0, y: -UIApplication.shared.statusBarFrame.height, width: view.bounds.width, height: UIApplication.shared.statusBarFrame.height))
        statusBarBackgroundView.backgroundColor = Colors.backgroundColor
        view.addSubview(statusBarBackgroundView)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: true)
    }
}


