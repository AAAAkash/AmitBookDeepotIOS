//
//  LibraryViewModel.swift
//  AmitBookDepot
//
//  Created by TUSHAR on 15/08/23.
//

import Foundation
class LibraryViewModel: NSObject {
    
    func fetchCategoriesApi(_ result:@escaping(CategoriesResponseModel?) -> Void){
        Progress.instance.show()
        let headers: [String: String] = ["authorization": "\(UserDefaults.standard.value(forKey: "AccessToken") ?? "")"]
        ApiManager<CategoriesResponseModel>.makeApiCall("\(APIUrl.UserApis.categories)", params: [:], headers: headers, method: .get) { (response, model) in
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
