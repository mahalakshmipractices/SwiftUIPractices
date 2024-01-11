//
//  ValidatedSecureTextField.swift
//  AllSamples
//
//  Created by mahalakshmi.s46 on 2024-01-08.
//

import SwiftUI

struct ValidatedSecureTextField: View {
    @Binding var text: String
    var placeHolder: String
    @Binding var isValid: Bool
    
    var body: some View {
        SecureField(placeHolder, text:$text)
            .padding()
            .background(.white)
            .border(isValid ? .gray : .red)
    }
}

#Preview {
    ValidatedSecureTextField(text: .constant("Sample Password"), placeHolder: "Enter Password", isValid: .constant(true))
}
