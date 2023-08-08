//
//  LoginVC.swift
//  AmitBookDepot
//
//  Created by TUSHAR on 05/08/23.
//

import UIKit

class LoginVC: BaseVC {
    
    @IBOutlet weak var btnGoogle: UIButton!
    @IBOutlet weak var btnHidePassword: UIButton!
    @IBOutlet weak var btnFB: UIButton!
    @IBOutlet weak var btnForgottPassword: UIButton!
    @IBOutlet weak var btnRegisterHere: UIButton!
    @IBOutlet weak var btnDntHaveAccount: UIButton!
    @IBOutlet weak var btnLoginWithOTP: UIButton!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var txtFldPassword: FloatingLabelInput!
    @IBOutlet weak var txtFldMobile: FloatingLabelInput!
    
    var isMobile = true
    let viewModel: LoginViewModel = LoginViewModel()
    var hidePassword = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btnLogin.layer.cornerRadius = 5.0
        self.btnLogin.clipsToBounds = true
        
        self.btnLoginWithOTP.layer.cornerRadius = 5.0
        self.btnLoginWithOTP.clipsToBounds = true
        self.btnLoginWithOTP.layer.borderColor = UIColor.systemMint.cgColor
        self.btnLoginWithOTP.layer.borderWidth = 1.0
        
        self.btnGoogle.layer.cornerRadius = 5.0
        self.btnGoogle.clipsToBounds = true

        self.btnFB.layer.cornerRadius = 5.0
        self.btnFB.clipsToBounds = true
        
        self.txtFldPassword.setRightPadding(50)
        self.txtFldPassword.placeholder = "Password"
        self.checkMobileLogin()
    }
    
    func checkMobileLogin() {
        self.txtFldMobile.text = ""
        self.txtFldPassword.text = ""
        if self.isMobile == true {
            self.btnHidePassword.isHidden = true
            self.txtFldMobile.keyboardType = .numberPad
            self.txtFldMobile.placeholder = "Mobile Number"
            self.txtFldPassword.isHidden = true
            self.btnLoginWithOTP.setTitle("Login via Email", for: .normal)
        } else {
            self.btnHidePassword.isHidden = false
            self.txtFldMobile.placeholder = "E-Mail"
            self.txtFldMobile.keyboardType = .emailAddress
            self.txtFldPassword.isHidden = false
            self.btnLoginWithOTP.setTitle("Login with OTP", for: .normal)
        }
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
    
    @IBAction func actionSkip(_ sender: Any) {
    }
    
    @IBAction func actionGoogle(_ sender: Any) {
    }
    
    @IBAction func actionFB(_ sender: Any) {
    }
    
    @IBAction func actionForgotPassword(_ sender: Any) {
        let destinationViewController = AppStoryBoards.loginSignUp.instantiateViewController(withIdentifier: "ForgotPasswordVC") as? ForgotPasswordVC
        self.navigationController?.pushViewController(destinationViewController!, animated: true)
    }
    
    @IBAction func actionRegisterAccount(_ sender: Any) {
        NotificationCenter.default.post(name: Notification.Name("GoToSignUp"), object: nil)
    }
    
    @IBAction func actionDntHaveAcccount(_ sender: Any) {
    }
    
    @IBAction func actionLoginWithOTP(_ sender: Any) {
        self.isMobile = !self.isMobile
        self.checkMobileLogin()
    }
    
    @IBAction func actionlogin(_ sender: Any) {
        let loginModel  = LoginModel(email: self.txtFldMobile.text ?? "", password: (txtFldPassword.text?.trimmed ?? ""))
        viewModel.model = loginModel
        viewModel.validateLoginModel(isMobile: self.isMobile) {[weak self] success, error  in
            guard let strongSelf = self else { return }
            if error == nil {
                if let param = success {
                    print(param)
                    self?.view.endEditing(true)
                    viewModel.loginUserApiCall(param) { model in
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
}
