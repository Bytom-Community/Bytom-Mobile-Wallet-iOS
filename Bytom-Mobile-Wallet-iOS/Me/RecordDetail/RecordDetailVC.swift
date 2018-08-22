//
//  RecordDetailVC.swift
//  Bytom-Mobile-Wallet-iOS
//
//  Created by ldp on 2018/6/15.
//  Copyright © 2018年 曲终叶落. All rights reserved.
//

import UIKit

class RecordDetailVC: UITableViewController {
    
    @IBOutlet weak var amountLB: UILabel!
    
    var transaction: TransactionsModel = TransactionsModel()

    fileprivate lazy var dataSource: [String] = ["交易状态","发送方","接收方","矿工费","备注","交易号","时间"]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.tableFooterView = UIView()
        self.tableView.estimatedRowHeight = 60
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        switch transaction.op {
        case "send":
            if transaction.amount != 0{
                self.amountLB.text = "-\(transaction.amount)"
            }
            break;
        case "receive":
            if transaction.amount != 0{
                self.amountLB.text = "+\(transaction.amount)"
            }
            break;
        default:
            break;
        }

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataSource.count
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecordDetailCellID", for: indexPath) as UITableViewCell
        
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        let titleLB = cell.viewWithTag(1000) as! UILabel
        let contentLB = cell.viewWithTag(2000) as! UILabel
        
        titleLB.text = dataSource[indexPath.row]
        
        switch indexPath.row {
        case 0:
            if self.transaction.confirmation <= 6 {
                contentLB.text = "\(self.transaction.confirmation)/6 确认中"
            }else{
                contentLB.text = "交易成功"
            }
            break
        case 1:
            switch transaction.op {
            case "send":
                var address = ""
                if transaction.inputs.count > 0{
                    if address.isEmpty{
                        address = transaction.inputs[0].address
                    }
                }
                contentLB.text = address
                
                break
            case "receive":
                var address = ""
                if transaction.inputs.count > 0{
                    if address.isEmpty{
                        address = transaction.inputs[0].address
                    }
                }
                contentLB.text = address
                break
            default:
                break
            }
            break
        case 2:
            switch transaction.op {
            case "send":
                var address = ""
                if transaction.outputs.count > 0{
                    for output in transaction.outputs{
                        if output.position == 1{
                            address = output.address
                            break
                        }
                    }
                    if address.isEmpty{
                        address = transaction.outputs[0].address
                    }
                }
                contentLB.text = address

                break
            case "receive":
                var address = ""
                if transaction.outputs.count > 0{
                    for output in transaction.outputs{
                        if output.position == 1{
                            address = output.address
                            break
                        }
                    }
                    if address.isEmpty{
                        address = transaction.outputs[0].address
                    }
                }
                contentLB.text = address
                
                break
            default:
                break
            }

            break
        case 3:
            contentLB.text = String(Double(transaction.fee) / 1e8)
            break
        case 5:
            contentLB.text = transaction.id
            break
        case 6:
            contentLB.text = transaction.timestampToShow
            break
            
            
        default:
            contentLB.text = ""
            break
        }
        
        return cell
    }
}
