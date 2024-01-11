//
//  RegistrationFormView.swift
//  AllSamples
//
//  Created by mahalakshmi.s46 on 2024-01-08.
//

import SwiftUI

struct RegistrationFormView: View {
    @StateObject private var viewModel = RegistrationViewModel()
    @State private var isFormSubmitted: Bool = false
    
    var body: some View {
        VStack {
            ValidatedTextField(text: $viewModel.username, placeHolder: "Enter Username", isValid: isFormSubmitted ? $viewModel.isUserNameValid : .constant(true))
                .padding(.bottom, 10)
            ValidatedTextField(text: $viewModel.emailAddress, placeHolder: "Enter email address", isValid: isFormSubmitted ? $viewModel.isEmailAddressValid : .constant(true))
                .padding(.bottom, 10)
            ValidatedSecureTextField(text: $viewModel.password, placeHolder: "Enter Password", isValid: isFormSubmitted ? $viewModel.isPasswordValid : .constant(true))
                .padding(.bottom, 10)
            ValidatedSecureTextField(text: $viewModel.confirmPassword, placeHolder: "Enter Confirm Password", isValid: isFormSubmitted ? $viewModel.isConfirmPasswordValid : .constant(true))
                .padding(.bottom, 10)
            
            Button(action: {
                isFormSubmitted = true
                registrationAction()
            }) {
                Text("Register")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .cornerRadius(10.0)
            }
        }
        .padding()
        .padding(.top, 10)
        .alert(isPresented: $viewModel.showAlert) {
            Alert(
                title: Text("\(viewModel.alertTitle)"),
                message: Text("\(viewModel.alertMessage)"),
                dismissButton: .default(Text("OK")) {
                    
                }
            )
        }
    }
    
    private func registrationAction() {
        let fieldsToValidate: [(String, Bool)] = [
            ("Username is empty", viewModel.username.isEmpty || !viewModel.isUserNameValid),
            ("Email is not valid", viewModel.emailAddress.isEmpty || !viewModel.isEmailAddressValid),
            ("Password is not valid", viewModel.password.isEmpty || !viewModel.isPasswordValid),
            ("Confirm Password is not valid", viewModel.confirmPassword.isEmpty || !viewModel.isConfirmPasswordValid)
        ]
        viewModel.showAlert = true
        if let invalidField = fieldsToValidate.first(where: { $0.1}) {
            viewModel.alertTitle = "Alert"
            viewModel.alertMessage = invalidField.0
        } else if viewModel.isFormValid {
            viewModel.alertTitle = "Success"
            viewModel.alertMessage = "Registration Successful"
        } else {
            viewModel.alertTitle = "Alert"
            viewModel.alertMessage = "All fields are mandatory"
        }
    }
}

#Preview {
    RegistrationFormView()
}
