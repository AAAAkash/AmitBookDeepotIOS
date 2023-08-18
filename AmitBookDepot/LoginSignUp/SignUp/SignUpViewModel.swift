//
//  SignUpViewModel.swift
//  AmitBookDepot
//
//  Created by TUSHAR on 05/08/23.
//

import Foundation
class SignUpViewModel {
    var model: SignUpModel = SignUpModel()
    var error: String? = .none
    
    func validateSignUpModel(isMobile:Bool, completion: (_ success: [String: Any]?, _ error: String?) -> Void) {
        error = nil
        if isMobile == true {
            if model.fullName.isEmpty {
                error = ValidationError.emptyFullName
            } else if model.email.isEmpty {
                error = ValidationError.emptyMobile
            } else if model.email.count != 10 {
                error = ValidationError.invalidMobile
            } else if model.password.isEmpty {
                error = ValidationError.emptyPassword
            } else if model.password.count < 6 {
                error = ValidationError.invalidPassword
            } else if model.confirmPassword.isEmpty {
                error = ValidationError.emptyConfirmPassword
            } else if model.confirmPassword.count < 6 {
                error = ValidationError.invalidConfirmPassword
            } else if model.password != model.confirmPassword {
                error = ValidationError.noMatchPassword
            } else if model.isTerms == false {
                error = ValidationError.agreeTerms
            }
        } else {
            if model.fullName.isEmpty {
                error = ValidationError.emptyFullName
            } else if model.email.isEmpty {
                error = ValidationError.emptyEmail
            } else if !model.email.isValidEmailAddress  {
                error = ValidationError.invalidEmail
            } else if model.password.isEmpty {
                error = ValidationError.emptyPassword
            } else if model.password.count < 6 {
                error = ValidationError.invalidPassword
            } else if model.confirmPassword.isEmpty {
                error = ValidationError.emptyConfirmPassword
            } else if model.confirmPassword.count < 6 {
                error = ValidationError.invalidConfirmPassword
            } else if model.password != model.confirmPassword {
                error = ValidationError.noMatchPassword
            } else if model.isTerms == false {
                error = ValidationError.agreeTerms
            }
        }
        if error == nil {
            if isMobile == true {
                let param = ["email_or_phone": model.email, "name": model.fullName, "password": model.password, "register_by": "phone"]
                completion(param, nil)
            } else {
                let param = ["email_or_phone": model.email, "name": model.fullName, "password": model.password, "register_by": "email"]
                completion(param, nil)
            }
        } else {
            completion(nil, error)
        }
    }
}

extension SignUpViewModel {
    func signUpUserApiCall(_ params: [String: Any], _ result:@escaping(SignupResponseModel?) -> Void) {
        Progress.instance.show()
        ApiManager<SignupResponseModel>.makeApiCall(APIUrl.UserApis.signUp, params: params, headers: nil, method: .post) { (response, resultModel) in
            Progress.instance.hide()
            if resultModel?.result == true {
                result(resultModel)
            } else {
                showMessage(with: response?["message"] as? String ?? "")
            }
        }
    }
}
