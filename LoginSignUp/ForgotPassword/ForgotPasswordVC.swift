//
//  ForgotPasswordVC.swift
//  AmitBookDepot
//
//  Created by TUSHAR on 05/08/23.
//

import UIKit

class ForgotPasswordVC: BaseVC {

    @IBOutlet weak var btnContinue: UIButton!
    @IBOutlet weak var btnGoogle: UIButton!
    @IBOutlet weak var btnFB: UIButton!
    @IBOutlet weak var txtFldEmail: FloatingLabelInput!
    
    let viewModel: ForgotPasswordViewModel = ForgotPasswordViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnContinue.layer.cornerRadius = 5.0
        btnContinue.clipsToBounds = true
        
        btnFB.layer.cornerRadius = 5.0
        btnFB.clipsToBounds = true
        
        btnGoogle.layer.cornerRadius = 5.0
        btnGoogle.clipsToBounds = true
    }
    
    @IBAction func actionback(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func actionGoogle(_ sender: Any) {
    }
    
    @IBAction func actionFB(_ sender: Any) {
    }
    
    @IBAction func actionContinue(_ sender: Any) {
        let forgotPasswordModel  = ForgotPasswordModel(email: self.txtFldEmail.text ?? "")
        viewModel.model = forgotPasswordModel
        viewModel.validateForgotPasswordModel() {[weak self] success, error  in
            guard let strongSelf = self else { return }
            if error == nil {
                if let param = success {
                    print(param)
                    self?.view.endEditing(true)
                    viewModel.forgotPasswordApiCall(param) { model in
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
    
    @IBAction func actionSkipHere(_ sender: Any) {
    }
    
    @IBAction func actionLoginHere(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func actionDntHaveAccount(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
