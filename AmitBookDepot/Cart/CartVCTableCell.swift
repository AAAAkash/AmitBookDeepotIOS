//
//  CartVCTableCell.swift
//  AmitBookDepot
//
//  Created by MAc on 10/08/23.
//

import UIKit

class CartVCTableCell: UITableViewCell {
    
    @IBOutlet weak var viewCell: UIView!
    @IBOutlet weak var imgCell: UIImageView!
    @IBOutlet weak var btnPos: UIButton!
    @IBOutlet weak var btnNeg: UIButton!
    @IBOutlet weak var btnDel: UIButton!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblDetail: UILabel!
    @IBOutlet weak var lblSaleRent: UILabel!
    @IBOutlet weak var lblTotalPrice: UILabel!
    @IBOutlet weak var lblCount: UILabel!
    
    var count = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        btnPos.layer.cornerRadius = 5.0
        btnNeg.layer.cornerRadius = 5.0
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func btnPos(_ sender: Any) {
        if count < 10 {
            count = count + 1
            lblCount.text = "\(count)"
        }
    }
    
    @IBAction func btnNeg(_ sender: Any) {
        if count > 0 {
            count = count - 1
            lblCount.text = "\(count)"
        }
    }
}
