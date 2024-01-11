//
//  RegistrationViewModel.swift
//  AllSamples
//
//  Created by mahalakshmi.s46 on 2024-01-08.
//

import Foundation
import Combine

class RegistrationViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var emailAddress: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    
    @Published var isUserNameValid: Bool = false
    @Published var isEmailAddressValid: Bool = false
    @Published var isPasswordValid: Bool = false
    @Published var isConfirmPasswordValid: Bool = false
    
    private var cancellables: Set<AnyCancellable> = []
    
    @Published var showAlert: Bool = false
    @Published var alertTitle: String = ""
    @Published var alertMessage: String = ""
    
    init() {
        $username
            .map { !$0.isEmpty }
            .assign(to: \.isUserNameValid, on: self)
            .store(in: &cancellables)
        $emailAddress
            .map { $0.isValidEmail() }
            .assign(to: \.isEmailAddressValid, on: self)
            .store(in: &cancellables)
        $password
            .map { $0.count >= 6 }
            .assign(to: \.isPasswordValid, on: self)
            .store(in: &cancellables)
        
        Publishers.CombineLatest($password, $confirmPassword)
            .map { password, confirmPassword in
                    password == confirmPassword && confirmPassword.count >= 6
            }
            .assign(to: \.isConfirmPasswordValid, on: self)
            .store(in: &cancellables)
    }
    
    var isFormValid:Bool {
        return isUserNameValid && isEmailAddressValid && isPasswordValid && isConfirmPasswordValid
    }
}
