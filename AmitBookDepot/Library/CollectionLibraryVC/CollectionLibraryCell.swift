//
//  CollectionLibraryCell.swift
//  AmitBookDepot
//
//  Created by MAc on 08/08/23.
//

import UIKit

class CollectionLibraryCell: UICollectionViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var starView: UIView!
    @IBOutlet weak var lblSold: UILabel!
    @IBOutlet weak var lblReview: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
