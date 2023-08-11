//
//  BestSellingTblVwCell.swift
//  AmitBookDepot
//
//  Created by TUSHAR on 10/08/23.
//

import UIKit

class BestSellingTblVwCell: UITableViewCell {

    @IBOutlet weak var collVwBestSelling: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collVwBestSelling.dataSource = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension BestSellingTblVwCell: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BestSellingCollVwCell", for: indexPath) as? BestSellingCollVwCell else {
            return BestSellingCollVwCell()
        }
        return cell
    }
}
