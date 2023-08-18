//
//  BestSellingTblVwCell.swift
//  AmitBookDepot
//
//  Created by TUSHAR on 10/08/23.
//

import UIKit

class BestSellingTblVwCell: UITableViewCell {

    @IBOutlet weak var collVwBestSelling: UICollectionView!
    
    var bestSellerResponseDetails = [BestSellerResponseDetails]()
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collVwBestSelling.dataSource = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setDataCell(bestSellerData: [BestSellerResponseDetails]) {
        self.bestSellerResponseDetails.removeAll()
        self.bestSellerResponseDetails = bestSellerData
        self.collVwBestSelling.reloadData()
    }

}
extension BestSellingTblVwCell: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.bestSellerResponseDetails.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BestSellingCollVwCell", for: indexPath) as? BestSellingCollVwCell else {
            return BestSellingCollVwCell()
        }
        cell.lblBestSellingCell.text = self.bestSellerResponseDetails[indexPath.row].name ?? ""
        cell.lblPrice.text = "Rs \(self.bestSellerResponseDetails[indexPath.row].mrp ?? "")"
        cell.lblDetail.text = self.bestSellerResponseDetails[indexPath.row].author?[0].name ?? ""
        
        cell.imgBestSelling.sd_setImage(with: URL(string: "\(APIUrl.UserApis.baseURLImage)\(self.bestSellerResponseDetails[indexPath.row].featured_image ?? "")"))
        return cell
    }
}
