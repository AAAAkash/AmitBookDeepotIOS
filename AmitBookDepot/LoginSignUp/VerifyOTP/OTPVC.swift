//
//  OTPVC.swift
//  AmitBookDepot
//
//  Created by TUSHAR on 06/08/23.
//

import UIKit

class OTPVC: BaseVC {

    @IBOutlet weak var btnContinue: UIButton!
    @IBOutlet weak var txtFirst: UITextField!
    @IBOutlet weak var txtSecond: UITextField!
    @IBOutlet weak var txtThird: UITextField!
    @IBOutlet weak var txtFourth: UITextField!
    @IBOutlet weak var txtFifth: UITextField!
    @IBOutlet weak var txtSixth: UITextField!
    
    let viewModel: OTPViewModel = OTPViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        btnContinue.layer.cornerRadius = 5.0
        btnContinue.clipsToBounds = true
        
        self.txtFirst.delegate = self
        self.txtSecond.delegate = self
        self.txtThird.delegate = self
        self.txtFourth.delegate = self
        self.txtFifth.delegate = self
        self.txtSixth.delegate = self
        
        self.txtFirst.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        self.txtFirst.becomeFirstResponder()
    }
    
    @IBAction func actionback(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func actionContinue(_ sender: Any) {
        let txt1 = txtFirst.text?.trimmed ?? ""
        let txt2 = txtSecond.text?.trimmed ?? ""
        let txt3 = txtThird.text?.trimmed ?? ""
        let txt4 = txtFourth.text?.trimmed ?? ""
        let txt5 = txtFifth.text?.trimmed ?? ""
        let txt6 = txtSixth.text?.trimmed ?? ""
        let otpStr = txt1+txt2+txt3+txt4+txt5+txt6
        
        let oTPModel  = OTPModel(otp: otpStr)
        viewModel.model = oTPModel
        viewModel.validateOTPModel() {[weak self] success, error  in
            guard let strongSelf = self else { return }
            if error == nil {
                if let param = success {
                    print(param)
                    self?.view.endEditing(true)
                    viewModel.verifyOTPApiCall(param) { model in
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

extension OTPVC : UITextFieldDelegate{
    @objc func textFieldDidChange(_ textField: UITextField) {
        if #available(iOS 12.0, *) {
            if textField.textContentType == UITextContentType.oneTimeCode {
                //here split the text to your four text fields
                if let otpCode = textField.text, otpCode.count > 7 {
                    txtFirst.text = String(otpCode[otpCode.index(otpCode.startIndex, offsetBy: 0)])
                    txtSecond.text = String(otpCode[otpCode.index(otpCode.startIndex, offsetBy: 1)])
                    txtThird.text = String(otpCode[otpCode.index(otpCode.startIndex, offsetBy: 2)])
                    txtFourth.text = String(otpCode[otpCode.index(otpCode.startIndex, offsetBy: 3)])
                    txtFifth.text = String(otpCode[otpCode.index(otpCode.startIndex, offsetBy: 4)])
                    txtSixth.text = String(otpCode[otpCode.index(otpCode.startIndex, offsetBy: 5)])
                }
            }
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string.count == 1 {
            if textField == txtFirst {
                txtSecond?.becomeFirstResponder()
            }
            if textField == txtSecond {
                txtThird?.becomeFirstResponder()
            }
            if textField == txtThird {
                txtFourth?.becomeFirstResponder()
            }
            if textField == txtFourth {
                txtFifth?.becomeFirstResponder()
            }
            if textField == txtFifth {
                txtSixth?.becomeFirstResponder()
            }
            if textField == txtSixth {
                txtSixth?.resignFirstResponder()
                textField.text? = string
            }
            textField.text? = string
            return false
        } else {
            if textField == txtFirst {
                txtFirst?.becomeFirstResponder()
            }
            if textField == txtSecond {
                txtFirst?.becomeFirstResponder()
            }
            if textField == txtThird {
                txtSecond?.becomeFirstResponder()
            }
            if textField == txtFourth {
                txtThird?.becomeFirstResponder()
            }
            if textField == txtFifth {
                txtFourth?.becomeFirstResponder()
            }
            if textField == txtSixth {
                txtFifth?.becomeFirstResponder()
            }
            textField.text? = string
            return false
        }
    }
}
