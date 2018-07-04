//
//  RecordSectionHeaderView.swift
//  Bytom-Mobile-Wallet-iOS
//
//  Created by ldp on 2018/6/14.
//  Copyright © 2018年 曲终叶落. All rights reserved.
//

import UIKit

class RecordSectionHeaderView: UITableViewHeaderFooterView {
    
    var recordModel: RecordModel? {
        didSet {
            if (recordModel?.isExpanded)! {
                directionImage.image = R.image.arrow_down()
            } else {
                directionImage.image = R.image.arrow_right()
            }
            if (recordModel?.isExpanded)! {
                
            }

            titleLB.text = recordModel?.headerTitle
        }
    }
    
    var expandCallBack: (Bool) -> Void = { isExpanded in
        
    }
    
    var directionImage: UIImageView = UIImageView()
    var titleLB: UILabel = UILabel()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = UIColor.white
        
        let w = UIScreen.main.bounds.width

        titleLB.font = UIFont.systemFont(ofSize: 15)
        titleLB.textColor = Colors.darkGreyColor
        contentView.addSubview(titleLB)
        titleLB.text = "2018年6月"
        titleLB.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(15)
            make.height.equalTo(15)
            make.centerY.equalToSuperview().offset(0)
        }

        directionImage.image = R.image.arrow_right()
        directionImage.contentMode = UIViewContentMode.scaleAspectFit
        contentView.addSubview(directionImage)

        directionImage.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(w - 15 - 15)
            make.height.equalTo(10)
            make.centerY.equalToSuperview()
        }
        
        let button = UIButton(type: UIButtonType.custom)
        button.addTarget(self, action: #selector(onExpand(onExpand:)), for: .touchUpInside)
        contentView.addSubview(button)
        
        button.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsetsMake(0, 0, 0, 0))
        }
        
        let bottomLine = UIView()
        bottomLine.backgroundColor = Colors.lineColor
        contentView.addSubview(bottomLine)
        
        bottomLine.snp.makeConstraints { (make) in
            make.right.equalToSuperview()
            make.left.equalToSuperview().offset(15)
            make.height.equalTo(1)
            make.bottom.equalToSuperview()
        }
    }
    
    @objc func onExpand(onExpand: UIButton) {
        
        recordModel?.isExpanded = !(recordModel?.isExpanded)!
        
        expandCallBack((recordModel?.isExpanded)!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
