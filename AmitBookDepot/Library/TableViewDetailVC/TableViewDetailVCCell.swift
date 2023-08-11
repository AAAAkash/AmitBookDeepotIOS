//
//  TableViewDetailVCCell.swift
//  AmitBookDepot
//
//  Created by MAc on 09/08/23.
//

import UIKit

class TableViewDetailVCCell: UITableViewCell {
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    var arrImage = ["book","book","book","book"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        
        myCollectionView.register(UINib(nibName: "CollectionDetailCell", bundle: nil), forCellWithReuseIdentifier: "CollectionDetailCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension TableViewDetailVCCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "CollectionDetailCell", for: indexPath) as! CollectionDetailCell
        cell.imgView.image = UIImage(named: arrImage[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.myCollectionView.frame.size.width / 2, height: 300)
        
    }
    
}
