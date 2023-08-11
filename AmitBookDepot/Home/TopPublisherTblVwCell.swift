//
//  TopPublisherTblVwCell.swift
//  AmitBookDepot
//
//  Created by TUSHAR on 10/08/23.
//

import UIKit

class TopPublisherTblVwCell: UITableViewCell {

    @IBOutlet weak var topPublisherCollVw: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.topPublisherCollVw.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension TopPublisherTblVwCell: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopPublisherCollVwCell", for: indexPath) as? TopPublisherCollVwCell else {
            return TopPublisherCollVwCell()
        }
        return cell
    }
}
