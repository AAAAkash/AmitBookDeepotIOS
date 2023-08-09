//
//  LibraryVC.swift
//  AmitBookDepot
//
//  Created by TUSHAR on 05/08/23.
//

import UIKit

class LibraryVC: BaseVC {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imgView: UIImageView!
    
        var arrImage = ["facebook","facebook","facebook","facebook","facebook","facebook","facebook","facebook","facebook","facebook","facebook","facebook"]
        var arrLbl = ["Apllication Forms","College Books","Competetive Exams Books","Fiction","Free Products","Gift Items","Lab Coats","Magazine","Punjab Board Books","School Books","Stationery","Studt Material | Notes"]
        
        var imageNames = ["google","google","facebook","facebook"]
    
    var imageViews = [UIImageView]()
    var currentPage: Int = 0

    var autoSwipeTimer: Timer?
    let autoSwipeInterval: TimeInterval = 3.0

    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.register(UINib(nibName: "LibraryCollectionCell", bundle: nil), forCellWithReuseIdentifier: "LibraryCollectionCell")
        
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate = self
        
        // Load images into the imageViews array
        for imageName in imageNames {
            if let image = UIImage(named: imageName) {
                let imageView = UIImageView(image: image)
                imageView.contentMode = .scaleAspectFit
                imageView.clipsToBounds = true
                imageViews.append(imageView)
                scrollView.addSubview(imageView)
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let scrollViewWidth = scrollView.frame.width
                let scrollViewHeight = scrollView.frame.height
                
                for (index, subview) in scrollView.subviews.enumerated() {
                    if let imageView = subview as? UIImageView {
                        imageView.frame = CGRect(x: CGFloat(index) * scrollViewWidth, y: 0, width: scrollViewWidth, height: scrollViewHeight)
                    }
                }
                
                scrollView.contentSize = CGSize(width: scrollViewWidth * CGFloat(imageNames.count), height: scrollViewHeight)
            }
            
            override func viewDidAppear(_ animated: Bool) {
                super.viewDidAppear(animated)
                startAutoSwipeTimer()
            }
            
            override func viewWillDisappear(_ animated: Bool) {
                super.viewWillDisappear(animated)
                stopAutoSwipeTimer()
            }
            
            func startAutoSwipeTimer() {
                autoSwipeTimer = Timer.scheduledTimer(timeInterval: autoSwipeInterval, target: self, selector: #selector(autoSwipeImages), userInfo: nil, repeats: true)
            }
            
            func stopAutoSwipeTimer() {
                autoSwipeTimer?.invalidate()
                autoSwipeTimer = nil
            }
            
            @objc func autoSwipeImages() {
                currentPage = (currentPage + 1) % imageNames.count
                let offsetX = CGFloat(currentPage) * scrollView.frame.size.width
                scrollView.setContentOffset(CGPoint(x: offsetX, y: 0), animated: true)
            }
        }
extension LibraryVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrImage.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LibraryCollectionCell", for: indexPath) as! LibraryCollectionCell
        cell.cellImage.image = UIImage(named: arrImage[indexPath.item])
        cell.cellLbl.text = arrLbl[indexPath.item]
        cell.backView.layer.cornerRadius = 3
        cell.backView.layer.shadowColor = UIColor.lightGray.cgColor
        cell.backView.layer.shadowRadius = 1.0
        cell.backView.layer.shadowOpacity = 1.0
        cell.backView.layer.shadowOffset = CGSize(width: 1, height: 1)
        cell.backView.layer.masksToBounds = false
        return cell
        
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      
        return CGSize(width: self.collectionView.frame.size.width / 2, height: 80)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 || indexPath.row == 3 || indexPath.row == 4 || indexPath.row == 5 || indexPath.row == 6 || indexPath.row == 7 || indexPath.row == 11 {
            let vc = storyboard?.instantiateViewController(withIdentifier: "CollectionLibraryVC") as! CollectionLibraryVC
            self.navigationController?.pushViewController(vc,animated: true)
        } else {
            let vc = storyboard?.instantiateViewController(withIdentifier: "TableViewLibraryVC") as! TableViewLibraryVC
            self.navigationController?.pushViewController(vc,animated: true)
        }
    }
}
extension LibraryVC: UIScrollViewDelegate {
func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    let currentPage = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
    self.currentPage = currentPage
}
}
    
    

   


