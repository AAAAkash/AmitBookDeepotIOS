//
//  HomeVC.swift
//  AmitBookDepot
//
//  Created by TUSHAR on 05/08/23.
//

import UIKit

class HomeVC: BaseVC {
    
    @IBOutlet weak var tblVwDetails: UITableView! {
        didSet{
            tblVwDetails.separatorStyle = .none
            tblVwDetails.contentInsetAdjustmentBehavior = .never
            tblVwDetails.dataSource = self
            tblVwDetails.delegate = self
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
}

//MARK: TableViewDataSource
extension HomeVC: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CrouselTblVwCell", for: indexPath) as?  CrouselTblVwCell
            
            
            return cell!
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "BestSellingTblVwCell", for: indexPath) as?  BestSellingTblVwCell
            return cell!
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TopPublisherTblVwCell", for: indexPath) as?  TopPublisherTblVwCell
            return cell!
        } else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SpaceTblVwCell", for: indexPath) as?  SpaceTblVwCell
            return cell!
        } else if indexPath.row == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TodaysDealTblVwCell", for: indexPath) as?  TodaysDealTblVwCell
            return cell!
        }  else if indexPath.row == 5 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SpaceTblVwCell", for: indexPath) as?  SpaceTblVwCell
            return cell!
        } else if indexPath.row == 6 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FeaturedProductTblVwCell", for: indexPath) as?  FeaturedProductTblVwCell
            return cell!
        } else if indexPath.row == 7 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SpaceTblVwCell", for: indexPath) as?  SpaceTblVwCell
            return cell!
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "OfferTblVwCell", for: indexPath) as?  OfferTblVwCell
            return cell!
        }
    }
}

extension HomeVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
