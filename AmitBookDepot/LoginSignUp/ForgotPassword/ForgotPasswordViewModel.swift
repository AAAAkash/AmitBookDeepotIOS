//
//  ForgotPasswordViewModel.swift
//  AmitBookDepot
//
//  Created by TUSHAR on 06/08/23.
//

import Foundation
class ForgotPasswordViewModel {
    var model: ForgotPasswordModel = ForgotPasswordModel()
    var error: String? = .none
    
    func validateForgotPasswordModel(completion: (_ success: [String: Any]?, _ error: String?) -> Void) {
        error = nil
        if model.email.isEmpty {
            error = ValidationError.emptyEmail
        } else if !model.email.isValidEmailAddress  {
            error = ValidationError.invalidEmail
        }
        if error == nil {
            let param = ["email": model.email]
            completion(param, nil)
        } else {
            completion(nil, error)
        }
    }
}
extension ForgotPasswordViewModel {
    func forgotPasswordApiCall(_ params: [String: Any], _ result:@escaping(SignupResponseModel?) -> Void) {
        Progress.instance.show()
        ApiManager<SignupResponseModel>.makeApiCall(APIUrl.UserApis.forgotPassword, params: params, headers: nil, method: .post) { (response, resultModel) in
            Progress.instance.hide()
            if resultModel?.message?.contains("successfully") == true {
                result(resultModel)
            } else {
                showMessage(with: response?["message"] as? String ?? "")
            }
        }
    }
}
