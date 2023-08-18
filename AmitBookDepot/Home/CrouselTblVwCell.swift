//
//  CrouselTblVwCell.swift
//  AmitBookDepot
//
//  Created by TUSHAR on 08/08/23.
//

import UIKit
import SDWebImage

class CrouselTblVwCell: UITableViewCell {

    @IBOutlet weak var corouselCollectionView: UICollectionView!
    
    let cellPercentWidth: CGFloat = 0.7
    var centeredCollectionViewFlowLayout: CenteredCollectionViewFlowLayout!
    var featuredProductResponseDetails = [FeaturedProductResponseDetails]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        centeredCollectionViewFlowLayout = (corouselCollectionView.collectionViewLayout as! CenteredCollectionViewFlowLayout)

        corouselCollectionView.decelerationRate = UIScrollView.DecelerationRate.fast

       // corouselCollectionView.delegate = self
        corouselCollectionView.dataSource = self

        centeredCollectionViewFlowLayout.itemSize = CGSize(
            width: self.contentView.bounds.width * cellPercentWidth,
            height: self.contentView.bounds.height
        )

        // Configure the optional inter item spacing (OPTIONAL)
        centeredCollectionViewFlowLayout.minimumLineSpacing = 0
        
            // corouselCollectionView.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        

    }
    
    func setDataOnCell(featuredProductsData: [FeaturedProductResponseDetails]) {
        self.featuredProductResponseDetails.removeAll()
        self.featuredProductResponseDetails = featuredProductsData
        self.corouselCollectionView.reloadData()
    }

}
extension CrouselTblVwCell: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.featuredProductResponseDetails.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CrouselCollVwCell", for: indexPath) as? CrouselCollVwCell else {
            return CrouselCollVwCell()
        }
        cell.lblHistory.text = self.featuredProductResponseDetails[indexPath.row].name ?? ""
        cell.CrouselCollImagView.sd_setImage(with: URL(string: "\(APIUrl.UserApis.baseURLImage)\(self.featuredProductResponseDetails[indexPath.row].featured_image ?? "")"))
        return cell
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("Current centered index: \(String(describing: centeredCollectionViewFlowLayout.currentCenteredPage ?? nil))")
    }

    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        print("Current centered index: \(String(describing: centeredCollectionViewFlowLayout.currentCenteredPage ?? nil))")
    }
}

