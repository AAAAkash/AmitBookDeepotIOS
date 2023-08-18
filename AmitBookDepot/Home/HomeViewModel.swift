//
//  HomeViewModel.swift
//  AmitBookDepot
//
//  Created by TUSHAR on 15/08/23.
//

import Foundation
class HomeViewModel: NSObject {
    
    func fetchSettingsApi(_ result:@escaping(SettingsResponseModel?) -> Void){
        Progress.instance.show()
        let headers: [String: String] = ["authorization": "\(UserDefaults.standard.value(forKey: "AccessToken") ?? "")"]
        ApiManager<SettingsResponseModel>.makeApiCall("\(APIUrl.UserApis.settings)", params: [:], headers: headers, method: .get) { (response, model) in
            Progress.instance.hide()
            print(response)
            if model?.status == 200{
                result(model)
            }else{
                showMessage(with: response?["message"] as? String ?? "")
            }
        }
    }
    
    func fetchSlidersApi(_ result:@escaping(SliderResponseModel?) -> Void){
        Progress.instance.show()
        let headers: [String: String] = ["authorization": "\(UserDefaults.standard.value(forKey: "AccessToken") ?? "")"]
        ApiManager<SliderResponseModel>.makeApiCall("\(APIUrl.UserApis.sliders)", params: [:], headers: headers, method: .get) { (response, model) in
            Progress.instance.hide()
            print(response)
            if model?.status == 200{
                result(model)
            }else{
                showMessage(with: response?["message"] as? String ?? "")
            }
        }
    }
    
    func fetchBestSellerApi(_ result:@escaping(BestSellerResponseModel?) -> Void){
        Progress.instance.show()
        let headers: [String: String] = ["authorization": "\(UserDefaults.standard.value(forKey: "AccessToken") ?? "")"]
        ApiManager<BestSellerResponseModel>.makeApiCall("\(APIUrl.UserApis.productsBestSeller)", params: [:], headers: headers, method: .get) { (response, model) in
            Progress.instance.hide()
            print(response)
            if model?.status == 200{
                result(model)
            }else{
                showMessage(with: response?["message"] as? String ?? "")
            }
        }
    }
    func fetchBrandsTopApi(_ result:@escaping(BrandsTopResponseModel?) -> Void){
        Progress.instance.show()
        let headers: [String: String] = ["authorization": "\(UserDefaults.standard.value(forKey: "AccessToken") ?? "")"]
        ApiManager<BrandsTopResponseModel>.makeApiCall("\(APIUrl.UserApis.brandsTop)", params: [:], headers: headers, method: .get) { (response, model) in
            Progress.instance.hide()
            print(response)
            if model?.status == 200{
                result(model)
            }else{
                showMessage(with: response?["message"] as? String ?? "")
            }
        }
    }
    func fetchTodaysDealApi(_ result:@escaping(TodayDealResponseModel?) -> Void){
        Progress.instance.show()
        let headers: [String: String] = ["authorization": "\(UserDefaults.standard.value(forKey: "AccessToken") ?? "")"]
        ApiManager<TodayDealResponseModel>.makeApiCall("\(APIUrl.UserApis.brandsTop)", params: [:], headers: headers, method: .get) { (response, model) in
            Progress.instance.hide()
            print(response)
            if model?.status == 200{
                result(model)
            }else{
                showMessage(with: response?["message"] as? String ?? "")
            }
        }
    }
    func fetchFeaturedProductApi(_ result:@escaping(FeaturedProductResponseModel?) -> Void){
        Progress.instance.show()
        let headers: [String: String] = ["authorization": "\(UserDefaults.standard.value(forKey: "AccessToken") ?? "")"]
        ApiManager<FeaturedProductResponseModel>.makeApiCall("\(APIUrl.UserApis.productsFeatured)", params: [:], headers: headers, method: .get) { (response, model) in
            Progress.instance.hide()
            print(response)
            if model?.status == 200{
                result(model)
            }else{
                showMessage(with: response?["message"] as? String ?? "")
            }
        }
    }
    func fetchProductFlashDealApi(_ result:@escaping(ProductFlasDealResponseModel?) -> Void){
        Progress.instance.show()
        let headers: [String: String] = ["authorization": "\(UserDefaults.standard.value(forKey: "AccessToken") ?? "")"]
        ApiManager<ProductFlasDealResponseModel>.makeApiCall("\(APIUrl.UserApis.productsFlashDeal)", params: [:], headers: headers, method: .get) { (response, model) in
            Progress.instance.hide()
            print(response)
            if model?.status == 200{
                result(model)
            }else{
                showMessage(with: response?["message"] as? String ?? "")
            }
        }
    }
    func fetchCategoryFeaturedApi(_ result:@escaping(CategoryFeaturedResponseModel?) -> Void){
        Progress.instance.show()
        let headers: [String: String] = ["authorization": "\(UserDefaults.standard.value(forKey: "AccessToken") ?? "")"]
        ApiManager<CategoryFeaturedResponseModel>.makeApiCall("\(APIUrl.UserApis.categoriesFeatured)", params: [:], headers: headers, method: .get) { (response, model) in
            Progress.instance.hide()
            print(response)
            if model?.status == 200{
                result(model)
            }else{
                showMessage(with: response?["message"] as? String ?? "")
            }
        }
    }
}
