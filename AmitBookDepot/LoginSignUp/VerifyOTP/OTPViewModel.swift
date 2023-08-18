//
//  OTPViewModel.swift
//  AmitBookDepot
//
//  Created by TUSHAR on 06/08/23.
//

import Foundation
class OTPViewModel {
    var model: OTPModel = OTPModel()
    var error: String? = .none
    
    func validateOTPModel(completion: (_ success: [String: Any]?, _ error: String?) -> Void) {
        error = nil
        if model.otp.count != 6 {
            error = ValidationError.emptyOTP
        }
        if error == nil {
            let param = ["verification_code": model.otp, "phone": model.phone]
            completion(param, nil)
        } else {
            completion(nil, error)
        }
    }
}
extension OTPViewModel {
    func verifyOTPApiCall(_ params: [String: Any], _ result:@escaping(SignupResponseModel?) -> Void) {
        Progress.instance.show()
        ApiManager<SignupResponseModel>.makeApiCall(APIUrl.UserApis.verifyOTP, params: params, headers: nil, method: .post) { (response, resultModel) in
            Progress.instance.hide()
            if resultModel?.message?.contains("successfully") == true {
                result(resultModel)
            } else {
                showMessage(with: response?["message"] as? String ?? "")
            }
        }
    }
    
    func resendOTPApiCall(_ params: [String: Any], _ result:@escaping(SignupResponseModel?) -> Void) {
        Progress.instance.show()
        ApiManager<SignupResponseModel>.makeApiCall(APIUrl.UserApis.resendotplogin, params: params, headers: nil, method: .get) { (response, resultModel) in
            Progress.instance.hide()
            if resultModel?.message?.contains("successfully") == true {
                result(resultModel)
            } else {
                showMessage(with: response?["message"] as? String ?? "")
            }
        }
    }
}
