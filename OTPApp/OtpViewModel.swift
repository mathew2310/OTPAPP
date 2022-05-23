//
//  OtpViewModel.swift
//  OTPApp
//
//  Created by MAC on 23/05/22.
//

import Foundation

class OtpViewModel {
    
    // Hard coding OTP, assuming this is received from API for comparison purpose.
    let receivedOtp = "123456"
    func validateOtp(otpText: String)-> Bool {
        return otpText == receivedOtp ? true : false
    }
}
