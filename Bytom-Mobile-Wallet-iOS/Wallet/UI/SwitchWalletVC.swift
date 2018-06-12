//
//  SwitchWalletVC.swift
//  Bytom-Mobile-Wallet-iOS
//
//  Created by 曲终叶落 on 2018/6/12.
//  Copyright © 2018年 曲终叶落. All rights reserved.
//

import UIKit

class SwitchWalletVC: UIViewController {
    @IBOutlet weak var switchView: UIView!
    @IBOutlet weak var switchViewTrailing: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = Colors.backgroundColor.withAlphaComponent(0.3)
        self.switchViewTrailing.constant = 200
        tableView.delegate = self
        tableView.dataSource = self
    }
    
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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let titles = ["私房钱","小金库","零钱包","创建钱包","导入钱包"]
        let cell = tableView.dequeueReusableCell(withIdentifier: SwitchWalletCell.ID) as! SwitchWalletCell
        cell.titleLb.text = titles[indexPath.row]
        cell.titleLb.textColor = Colors.whiteColor
        if indexPath.row == 0 {
            cell.titleLb.textColor = Colors.mainColor
        }
        
        if indexPath.row == 2 {
            cell.lineView.isHidden = false
        }else{
            cell.lineView.isHidden = true
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
