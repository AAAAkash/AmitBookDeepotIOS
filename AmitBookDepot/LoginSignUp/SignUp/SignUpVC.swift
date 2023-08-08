//
//  SignUpVC.swift
//  AmitBookDepot
//
//  Created by TUSHAR on 05/08/23.
//

import UIKit

class SignUpVC: BaseVC {

    @IBOutlet weak var btnGoogle: UIButton!
    @IBOutlet weak var btnFB: UIButton!
    @IBOutlet weak var btnCreateAccount: UIButton!
    @IBOutlet weak var btnTerms: UIButton!
    @IBOutlet weak var btnHideConfirmPassword: UIButton!
    @IBOutlet weak var txtFldConfirmPassword: FloatingLabelInput!
    @IBOutlet weak var btnHidePassword: UIButton!
    @IBOutlet weak var txtFldPassword: FloatingLabelInput!
    @IBOutlet weak var btnUseMobileNumber: UIButton!
    @IBOutlet weak var txtFldMobile: FloatingLabelInput!
    @IBOutlet weak var txtFldFullName: FloatingLabelInput!
    
    var isMobile = true
    var hidePassword = true
    var hideConfirmPassword = true
    var isAgreeTerms = false
    let viewModel: SignUpViewModel = SignUpViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        txtFldFullName.placeholder = "Full Name"
        txtFldMobile.placeholder = "Mobile Number"
        txtFldPassword.placeholder = "Password"
        txtFldConfirmPassword.placeholder = "Confirm Password"
        
        btnCreateAccount.layer.cornerRadius = 5.0
        btnCreateAccount.clipsToBounds = true
        
        btnFB.layer.cornerRadius = 5.0
        btnFB.clipsToBounds = true
        
        btnGoogle.layer.cornerRadius = 5.0
        btnGoogle.clipsToBounds = true
        checkMobileLogin()
    }
    
    func checkMobileLogin() {
        self.txtFldMobile.text = ""
        if self.isMobile == true {
            self.txtFldMobile.keyboardType = .numberPad
            self.txtFldMobile.placeholder = "Mobile Number"
            self.btnUseMobileNumber.setTitle("Use E-mail", for: .normal)
        } else {
            self.txtFldMobile.placeholder = "E-Mail"
            self.txtFldMobile.keyboardType = .emailAddress
            self.btnUseMobileNumber.setTitle("Use Mobile Number", for: .normal)
        }
    }
    
    @IBAction func actionUseMobile(_ sender: Any) {
        self.isMobile = !self.isMobile
        self.checkMobileLogin()
    }
    
    @IBAction func actionHidePassword(_ sender: Any) {
        self.hidePassword = !self.hidePassword
        if self.hidePassword == true {
            btnHidePassword.setImage(UIImage(named: "showPassword"), for: .normal)
            self.txtFldPassword.isSecureTextEntry = true
        } else {
            btnHidePassword.setImage(UIImage(named: "hidePassword"), for: .normal)
            self.txtFldPassword.isSecureTextEntry = false
        }
    }
    
    @IBAction func actionShowConfirmPassword(_ sender: Any) {
        self.hideConfirmPassword = !self.hideConfirmPassword
        if self.hideConfirmPassword == true {
            btnHideConfirmPassword.setImage(UIImage(named: "showPassword"), for: .normal)
            self.txtFldConfirmPassword.isSecureTextEntry = true
        } else {
            btnHideConfirmPassword.setImage(UIImage(named: "hidePassword"), for: .normal)
            self.txtFldConfirmPassword.isSecureTextEntry = false
        }
    }
    
    @IBAction func actionAgreeToTerms(_ sender: Any) {
        self.isAgreeTerms = !self.isAgreeTerms
        self.btnTerms.setImage(((self.isAgreeTerms == true) ? UIImage(named: "check-box") : UIImage(named: "check-box-empty")), for: .normal)
    }
    
    @IBAction func actiontermsConditions(_ sender: Any) {
        let destinationViewController = AppStoryBoards.loginSignUp.instantiateViewController(withIdentifier: "OTPVC") as? OTPVC
        self.navigationController?.pushViewController(destinationViewController!, animated: true)
    }
    
    @IBAction func actionCreateAccount(_ sender: Any) {
        let signUpModel  = SignUpModel(email: self.txtFldMobile.text ?? "", password: self.txtFldPassword.text ?? "", fullName: self.txtFldFullName.text ?? "", confirmPassword: txtFldConfirmPassword.text ?? "", isTerms: self.isAgreeTerms)
        viewModel.model = signUpModel
        viewModel.validateSignUpModel(isMobile: self.isMobile) {[weak self] success, error  in
            guard let strongSelf = self else { return }
            if error == nil {
                if let param = success {
                    print(param)
                    self?.view.endEditing(true)
                    viewModel.signUpUserApiCall(param) { model in
                        if model?.statusCode == 200 {
                            
                        } else {
                            if let errorMsg = model?.message {
                                showMessage(with: errorMsg)
                            }
                        }
                    }
                }
            } else {
                showMessage(with: error ?? "Something went wrong")
            }
        }
    }
    
    @IBAction func actionLoginHere(_ sender: Any) {
        NotificationCenter.default.post(name: Notification.Name("GoToLogin"), object: nil)
    }
    
    @IBAction func actionGoogle(_ sender: Any) {
    }
    
    @IBAction func actionFB(_ sender: Any) {
    }
    
    @IBAction func actionSkip(_ sender: Any) {
    }
}
