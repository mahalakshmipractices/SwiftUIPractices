//
//  ValidatedTextField.swift
//  AllPractices
//
//  Created by mahalakshmi.s46 on 2024-01-09.
//

import SwiftUI

struct ValidatedTextField: View {
    @Binding var text: String
    var placeHolder: String
    @Binding var isValid: Bool
    
    var body: some View {
        TextField(placeHolder, text:$text)
            .padding()
            .background(.white)
            .border(isValid ? .gray : .red)
    }
}

#Preview {
    ValidatedTextField(text: .constant("Sample"), placeHolder: "Enter User Name", isValid: .constant(true))
}
