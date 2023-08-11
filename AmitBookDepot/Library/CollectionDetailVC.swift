//
//  CollectionDetailVC.swift
//  AmitBookDepot
//
//  Created by MAc on 09/08/23.
//

import UIKit

class CollectionDetailVC: UIViewController {
    
    
    @IBOutlet weak var btnHeart: UIButton!
    @IBOutlet weak var btnShare: UIButton!
    
    @IBOutlet weak var lblInStock: UILabel!
    @IBOutlet weak var posNegView: UIView!
    
    @IBOutlet weak var btnAddToCart: UIButton!
    
    @IBOutlet weak var btnBuyNow: UIButton!
    
    
    
    @IBOutlet weak var soldByStackView: UIStackView!
    
    @IBOutlet weak var btnMsgSeller: UIButton!
    
   // @IBOutlet weak var scrollViewImage: UIScrollView!
    
    
    
    @IBOutlet weak var btnDescription: UIButton!
    
    @IBOutlet weak var policiesView: UIView!
    
    @IBOutlet weak var btnVideo: UIButton!
    
    @IBOutlet weak var lblDescription: UILabel!
    
    
    
    @IBOutlet weak var btnSellerPolicy: UIButton!
    @IBOutlet weak var btnReturnPolicy: UIButton!
    @IBOutlet weak var btnSupportPolicy: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ButtonUnderline()
        
        lblDescription.isHidden = true
        
        btnHeart.layer.cornerRadius = 18
        btnShare.layer.cornerRadius = 18
        
        
        lblInStock.layer.cornerRadius = 10
        
        posNegView.layer.borderWidth = 0.5
        posNegView.layer.borderColor = UIColor.systemGray2.cgColor
        posNegView.layer.cornerRadius = 3
        
        soldByStackView.layer.borderWidth = 0.5
        soldByStackView.layer.borderColor = UIColor.systemGray2.cgColor
        soldByStackView.layer.cornerRadius = 3
        
        btnAddToCart.layer.borderWidth = 0.5
        btnAddToCart.layer.borderColor = UIColor.systemMint.cgColor
        btnAddToCart.layer.cornerRadius = 3
        
        btnDescription.layer.borderWidth = 0.5
        btnDescription.layer.borderColor = UIColor.systemGray2.cgColor
        btnDescription.layer.cornerRadius = 3

        btnVideo.layer.borderWidth = 0.5
        btnVideo.layer.borderColor = UIColor.systemGray2.cgColor
        btnVideo.layer.cornerRadius = 3
        
        policiesView.layer.borderWidth = 0.5
        policiesView.layer.borderColor = UIColor.systemGray2.cgColor
        policiesView.layer.cornerRadius = 3

        btnBuyNow.layer.cornerRadius = 3
        btnMsgSeller.layer.cornerRadius = 3
         
       // btnHeart.roundCorners()
        
//        scrollViewImage.isPagingEnabled = true
//        scrollViewImage.showsHorizontalScrollIndicator = false
        
        
        func ButtonUnderline(){
            let underlineAttribute = [NSAttributedString.Key.underlineStyle:NSUnderlineStyle.single.rawValue]
            let attributedTitle = NSAttributedString(string: "Seller Policy", attributes: underlineAttribute)
            let attributedTitle2 = NSAttributedString(string: "Return Policy", attributes: underlineAttribute)
            let attributedTitle3 = NSAttributedString(string: "Support Policy", attributes: underlineAttribute)
            btnSellerPolicy.setAttributedTitle(attributedTitle, for: .normal)
            btnReturnPolicy.setAttributedTitle(attributedTitle, for: .normal)
            btnSupportPolicy.setAttributedTitle(attributedTitle, for: .normal)
            
            
        }
        
        
        
        
    }
    @IBAction func btnDesciptionAction(_ sender: Any) {
        lblDescription.isHidden = false
        lblDescription.text = "No Description"
        btnDescription.backgroundColor = .systemMint
        btnVideo.backgroundColor = .systemBackground
    }
    
    @IBAction func btnVideoAction(_ sender: Any) {
        lblDescription.isHidden = false
        lblDescription.text = "No Video"
        btnVideo.backgroundColor = .systemMint
        btnDescription.backgroundColor = .systemBackground
    }
    
    
}
