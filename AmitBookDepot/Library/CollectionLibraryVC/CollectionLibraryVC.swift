//
//  CollectionLibraryVC.swift
//  AmitBookDepot
//
//  Created by MAc on 08/08/23.
//

import UIKit

class CollectionLibraryVC: UIViewController {
    
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    var arrimage = ["AmitLogo","AmitLogo","AmitLogo","AmitLogo"]
    var arrDiscription = ["fjhbfhjsabfjh","nsaddjkfhajkfjkadhgfjhkadg","afhyghfgfghagfsdag","bjshdkjfgsdajkgfvhjsadhbgfjsadg","asbfjhbghhjfghsdgfa"]
    var price = ["Rs 5,000.00","Rs 6,000.00","Rs 80,000.00","Rs 70,000.00","Rs 2,000,00.00"]

    override func viewDidLoad() {
        super.viewDidLoad()

     
        self.myCollectionView.register(UINib(nibName: "CollectionLibraryCell", bundle: nil), forCellWithReuseIdentifier: "CollectionLibraryCell")
        
        
    }
    

 
}
extension CollectionLibraryVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrimage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionLibraryCell", for: indexPath) as! CollectionLibraryCell
        cell.imgView.image = UIImage(named: arrimage[indexPath.row])
        cell.lblDescription.text = arrDiscription[indexPath.row]
        cell.lblPrice.text = price[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.myCollectionView.frame.size.width / 2, height: 250)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "CollectionDetailVC") as! CollectionDetailVC
        self.navigationController?.pushViewController(vc,animated: true)
    }
    
}
