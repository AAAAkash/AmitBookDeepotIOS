//
//  CollectionDetailCell.swift
//  AmitBookDepot
//
//  Created by MAc on 09/08/23.
//

import UIKit

class CollectionDetailCell: UICollectionViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var starRating: UIView!
    @IBOutlet weak var lblSold: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
