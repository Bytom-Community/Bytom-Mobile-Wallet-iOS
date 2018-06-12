//
//  MeVC.swift
//  Bytom-Mobile-Wallet-iOS
//
//  Created by ldp on 2018/6/11.
//  Copyright © 2018年 曲终叶落. All rights reserved.
//

import UIKit
import SwiftForms

class MeVC: FormViewController {
    
    lazy var header: MeHeaderView = {
        let header = MeHeaderView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 200.0))
        header.backgroundColor = UIColor(hexString: "20252d")
        return header
    }()
    
    struct Static {
        static let nodeTag = "node"
        static let coinTag = "coin"
        static let shareTag = "share"
        static let aboutTag = "about"
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.tableHeaderView = header
        self.tableView.separatorStyle = .singleLine
        self.tableView.tableFooterView = UIView(frame: .zero)
        
        if !UIDevice.current.isX() {
            if #available(iOS 11.0, *) {
                self.tableView?.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentBehavior.never
            } else {
                self.automaticallyAdjustsScrollViewInsets = false
            }
        }
        

        let form = FormDescriptor()
        
        let section = FormSectionDescriptor(headerTitle: nil, footerTitle: nil)
        section.headerViewHeight = 0;
        section.footerViewHeight = 0;
        //节点
        var row = FormRowDescriptor(tag: Static.nodeTag, type: .unknown, title: "节点")
        row.configuration.cell.cellClass = MeMenuCell.self
        row.configuration.cell.appearance = ["imageView.image": R.image.node() as Any,
                                             "titleLabel.text": "节点"] as [String : AnyObject]
        row.configuration.cell.showsInputToolbar = true
        section.rows.append(row)

        //货币
        row = FormRowDescriptor(tag: Static.coinTag, type: .unknown, title: "货币")
        row.configuration.cell.cellClass = MeMenuCell.self
        row.configuration.cell.appearance = ["imageView.image": R.image.legal_tender() as Any,
                                             "titleLabel.text": "货币"] as [String : AnyObject]
        row.configuration.cell.showsInputToolbar = true
        section.rows.append(row)

        //分享
        row = FormRowDescriptor(tag: Static.shareTag, type: .unknown, title: "分享")
        row.configuration.cell.cellClass = MeMenuCell.self
        row.configuration.cell.appearance = ["imageView.image": R.image.share() as Any,
                                             "titleLabel.text": "分享"] as [String : AnyObject]
        row.configuration.cell.showsInputToolbar = true
        section.rows.append(row)
        
        form.sections = [section]

        //关于
        row = FormRowDescriptor(tag: Static.aboutTag, type: .unknown, title: "关于")
        row.configuration.cell.cellClass = MeMenuCell.self
        row.configuration.cell.appearance = ["imageView.image": R.image.info() as Any,
                                             "titleLabel.text": "关于"] as [String : AnyObject]
        row.configuration.cell.showsInputToolbar = true
        section.rows.append(row)


        self.form = form
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if cell.responds(to: #selector(setter: UIView.layoutMargins)) {
            //cell.layoutMargins = UIEdgeInsetsMake(0, 50, 0, 0)
            cell.layoutMargins = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
//            cell.layoutMargins = UIEdgeInsets.zero
        }
        if cell.responds(to:  #selector(setter: UITableViewCell.separatorInset)) {
            cell.separatorInset = UIEdgeInsetsMake(0, 15, 0, 0)
            //cell.separatorInset = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 0)
//            cell.separatorInset = UIEdgeInsets.zero
        }
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        super.viewWillDisappear(animated)
    }

}


