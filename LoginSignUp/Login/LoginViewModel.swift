//
//  LoginViewModel.swift
//  AmitBookDepot
//
//  Created by TUSHAR on 05/08/23.
//

import Foundation

class LoginViewModel {
    var model: LoginModel = LoginModel()
    var error: String? = .none
    
    func validateLoginModel(isMobile:Bool, completion: (_ success: [String: Any]?, _ error: String?) -> Void) {
        error = nil
        if isMobile == true {
            if model.email.isEmpty {
                error = ValidationError.emptyMobile
            } else if model.email.count != 10 {
                error = ValidationError.invalidMobile
            }
        } else {
            if model.email.isEmpty {
                error = ValidationError.emptyEmail
            } else if !model.email.isValidEmailAddress  {
                error = ValidationError.invalidEmail
            } else if model.password.isEmpty {
                error = ValidationError.emptyPassword
            } else if model.password.count < 6 {
                error = ValidationError.invalidPassword
            }
        }
        if error == nil {
            if isMobile == true {
                let param = ["mobile": model.email]
                completion(param, nil)
            } else {
                let param = ["email": model.email, "password": model.password]
                completion(param, nil)
            }
        } else {
            completion(nil, error)
        }
    }
}

extension LoginViewModel {
    func loginUserApiCall(_ params: [String: Any], _ result:@escaping(SignupResponseModel?) -> Void) {
        Progress.instance.show()
        ApiManager<SignupResponseModel>.makeApiCall(APIUrl.UserApis.login, params: params, headers: nil, method: .post) { (response, resultModel) in
            Progress.instance.hide()
            if resultModel?.statusCode == 200 {
                result(resultModel)
            } else {
                showMessage(with: response?["message"] as? String ?? "")
            }
        }
    }
}
