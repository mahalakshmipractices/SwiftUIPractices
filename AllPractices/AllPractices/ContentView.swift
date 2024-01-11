//
//  ContentView.swift
//  AllPractices
//
//  Created by mahalakshmi.s46 on 2024-01-09.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                NavigationLink(destination: RegistrationFormView()) {
                    Text("Sample Registration Form")
                        .frame(width: 200, height: 20)
                        .padding()
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
