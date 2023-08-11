//
//  TodaysDealTblVwCell.swift
//  AmitBookDepot
//
//  Created by TUSHAR on 11/08/23.
//

import UIKit

class TodaysDealTblVwCell: UITableViewCell {

    @IBOutlet weak var collVwTodaysDeal: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.collVwTodaysDeal.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension TodaysDealTblVwCell: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TodaysDealCollVwCell", for: indexPath) as? TodaysDealCollVwCell else {
            return TodaysDealCollVwCell()
        }
        return cell
    }
}
