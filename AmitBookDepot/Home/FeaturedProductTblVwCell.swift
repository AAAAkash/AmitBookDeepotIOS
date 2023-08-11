//
//  FeaturedProductTblVwCell.swift
//  AmitBookDepot
//
//  Created by TUSHAR on 11/08/23.
//

import UIKit

class FeaturedProductTblVwCell: UITableViewCell {

    @IBOutlet weak var featuredCollVw: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.featuredCollVw.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension FeaturedProductTblVwCell: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeaturedCollVwCell", for: indexPath) as? FeaturedCollVwCell else {
            return FeaturedCollVwCell()
        }
        return cell
    }
}
