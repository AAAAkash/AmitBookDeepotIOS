//
//  HomeVC.swift
//  AmitBookDepot
//
//  Created by TUSHAR on 05/08/23.
//

import UIKit

class HomeVC: BaseVC {
    
    let homeViewModel: HomeViewModel = HomeViewModel()
    var sliderData = [SliderResponseDetails]()
    var bestSellerData = [BestSellerResponseDetails]()
    var brandsTopData = [BrandsTopResponseDetails]()
    var todayDealData = [TodayDealResponseDetails]()
    var featuredProductsData = [FeaturedProductResponseDetails]()
    var categoryFeaturedData = [CategoryFeaturedDeatils]()
    
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
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.fetchSettingsApi()
    }
    
    func fetchSettingsApi() {
        homeViewModel.fetchSettingsApi() { [weak self] (model) in
            DispatchQueue.main.async {
                print(model?.status)
                self?.fetchSlidersApi()
            }
        }
    }
    func fetchSlidersApi() {
        homeViewModel.fetchSlidersApi() { [weak self] (model) in
            DispatchQueue.main.async {
                print(model?.status)
                self?.sliderData.removeAll()
                self?.sliderData = model?.data ?? [SliderResponseDetails]()
                self?.fetchBestSellerApi()
            }
        }
    }
    func fetchBestSellerApi() {
        homeViewModel.fetchBestSellerApi() { [weak self] (model) in
            DispatchQueue.main.async {
                print(model?.status)
                self?.bestSellerData.removeAll()
                self?.bestSellerData = model?.data ?? [BestSellerResponseDetails]()
                self?.fetchBrandsTopApi()
            }
        }
    }
    
    func fetchBrandsTopApi() {
        homeViewModel.fetchBrandsTopApi() { [weak self] (model) in
            DispatchQueue.main.async {
                print(model?.status)
                self?.fetchTodaysDealApi()
            }
        }
    }
    
    func fetchTodaysDealApi() {
        homeViewModel.fetchTodaysDealApi() { [weak self] (model) in
            DispatchQueue.main.async {
                print(model?.status)
                self?.fetchFeaturedProductApi()
            }
        }
    }
    func fetchFeaturedProductApi() {
        homeViewModel.fetchFeaturedProductApi() { [weak self] (model) in
            DispatchQueue.main.async {
                print(model?.status)
                self?.featuredProductsData.removeAll()
                self?.featuredProductsData = model?.data ?? [FeaturedProductResponseDetails]()
                self?.fetchProductFlashDealApi()
            }
        }
    }
    func fetchProductFlashDealApi() {
        homeViewModel.fetchProductFlashDealApi() { [weak self] (model) in
            DispatchQueue.main.async {
                print(model?.status)
                self?.fetchCategoryFeaturedApi()
            }
        }
    }
    func fetchCategoryFeaturedApi() {
        homeViewModel.fetchCategoryFeaturedApi() { [weak self] (model) in
            DispatchQueue.main.async {
                print(model?.status)
                self?.tblVwDetails.reloadData()
            }
        }
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
            cell?.setDataOnCell(featuredProductsData: self.featuredProductsData)
            return cell!
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "BestSellingTblVwCell", for: indexPath) as?  BestSellingTblVwCell
            cell?.setDataCell(bestSellerData: self.bestSellerData)
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
