//
//  SearchTableCell.swift
//  AmitBookDepot
//
//  Created by MAc on 10/08/23.
//

import UIKit

class SearchTableCell: UITableViewCell {
    
    
    @IBOutlet weak var lblDetail: UILabel!
    
    @IBOutlet weak var lblAuthorName: UILabel!
    
    @IBOutlet weak var lblPrice: UILabel!
    
    @IBOutlet weak var cellView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
