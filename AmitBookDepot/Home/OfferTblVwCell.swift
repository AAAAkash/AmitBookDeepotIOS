//
//  OfferTblVwCell.swift
//  AmitBookDepot
//
//  Created by TUSHAR on 11/08/23.
//

import UIKit

class OfferTblVwCell: UITableViewCell {

    @IBOutlet weak var collVwOffers: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collVwOffers.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension OfferTblVwCell: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OffersCollVwCell", for: indexPath) as? OffersCollVwCell else {
            return OffersCollVwCell()
        }
        return cell
    }
}
