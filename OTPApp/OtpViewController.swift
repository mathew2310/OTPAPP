//
//  ViewController.swift
//  OTPApp
//
//  Created by Mathew Ijidakinro on 18/05/2022.
//

import UIKit

final class OtpViewController: UIViewController {
    
    @IBOutlet private weak var continueButton: UIButton!
    @IBOutlet private weak var otpTextField: UITextField!
    
    private let viewModel = OtpViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }

    private func setUpUI(){
        NotificationCenter.default.addObserver( self,selector:#selector(self.keyboardDidShow), name: UITextField.textDidChangeNotification, object: otpTextField)
        otpTextField.becomeFirstResponder()
    }
    

    @IBAction func clearOTPField(_ sender: Any) {
        otpTextField.text = ""
    }
    
    @objc func keyboardDidShow(notification: NSNotification){
        
        if viewModel.validateOtp(otpText: otpTextField.text ?? "") {
           navigateToHome()
        } else{
            continueButton.isEnabled = false
            if otpTextField.text?.count == 6 {
                showAlert()
                otpTextField.text = ""
            }
        }
        
    }
    
    @IBAction func loginButton(_ sender: Any) {
       navigateToHome()
    }
    
    private func showAlert() {
        let alertView = UIAlertController(title:"Alert", message:"OTP is not correct", preferredStyle:.alert)
        
        let action = UIAlertAction(title:"Ok", style: .cancel)
        
        alertView.addAction(action)
        
        self.present(alertView, animated: true)
    }
    
    private func navigateToHome() {
        let mainStoryBoardId: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let startVC = mainStoryBoardId.instantiateViewController(withIdentifier: "startViewController") as? StartViewController else{
            return
        }
        self.navigationController?.pushViewController(startVC, animated: true)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

