//
//  NodeVC.swift
//  Bytom-Mobile-Wallet-iOS
//
//  Created by ldp on 2018/6/15.
//  Copyright © 2018年 曲终叶落. All rights reserved.
//

import UIKit

class NodeVC: UIViewController {

    @IBOutlet weak var urlTF: UITextField!
    
    let defaultUrl: String = "https://w3.bytom.io"

    var resultClosure: selectResultClosure?
    
    private lazy var resetBtn: UIButton = {
       
        let button = UIButton.init(type: UIButtonType.custom)
        button.frame = CGRect(x: 0, y: 0, width: 80, height: 24)
        button.setTitle("默认节点", for: UIControlState.normal)
        button.setTitleColor(UIColor.white, for: UIControlState.normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.backgroundColor = Colors.remindColor
        button.cornerRadius = 5
        button.addTarget(self, action: #selector(resetOnClick), for: .touchUpInside)

        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        urlTF.rightView = resetBtn
        urlTF.rightViewMode = UITextFieldViewMode.always
    }

    @IBAction func submitOnClick(_ sender: Any) {
        if resultClosure != nil {
            resultClosure!(urlTF.text!)
        }
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func resetOnClick() {
        
        urlTF.text = defaultUrl
        
    }

    
}
