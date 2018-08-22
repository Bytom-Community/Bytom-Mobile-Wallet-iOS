//
//  RecordCell.swift
//  Bytom-Mobile-Wallet-iOS
//
//  Created by ldp on 2018/6/14.
//  Copyright © 2018年 曲终叶落. All rights reserved.
//

import UIKit

class RecordCell: UITableViewCell {

    @IBOutlet weak var btmAddressLB: UILabel!
    @IBOutlet weak var tradeStatusLB: UILabel!
    @IBOutlet weak var tradeValueLB: UILabel!
    @IBOutlet weak var tradeTimeLB: UILabel!
    @IBOutlet weak var opIV: UIImageView!
    
    var transaction = TransactionsModel() {
        didSet {
            
            switch transaction.op {
            case "send":
                opIV.image = R.image.transfer_out()
                
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
                
                btmAddressLB.text = address
                
                if transaction.amount != 0 {
                    tradeValueLB.text = "-\(transaction.amount)"
                }

                break
            case "receive":
                opIV.image = R.image.transfer_in()
                
                var address = ""

                if transaction.inputs.count > 0{

                    if address.isEmpty{
                        address = transaction.inputs[0].address
                    }
                }

                btmAddressLB.text = address

                if transaction.amount != 0{
                    tradeValueLB.text = "+\(transaction.amount)"
                }

                break
            default:
                opIV.image = nil
                break
            }

            if transaction.confirmation > 6{
               tradeStatusLB.text = "交易成功"
            }else{
               tradeStatusLB.text = "\(transaction.confirmation)/6 确认中"
            }
            
            tradeTimeLB.text = transaction.timestampToShow
        }
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
