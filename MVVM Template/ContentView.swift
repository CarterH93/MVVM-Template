//
//  ContentView.swift
//  MVVM Template
//
//  Created by Carter Hawkins on 12/26/24.
//

import SwiftUI

struct ContentView: View {
    @Environment(ViewModel.self) private var viewModel
    var body: some View {
        VStack {
            if viewModel.loggedIn {
                Text("Welcome")
                Text(viewModel.storage.userName)
            } else {
                UserInputs()
                
                Button("log In") {
                    viewModel.loggedIn = true
                    viewModel.clearPassword()
                }
                .disabled(viewModel.signInButtonDisabled)
            }
        }
        .padding()
    }
}

#Preview {
    @Previewable @State var viewModel = ViewModel()
    ContentView()
        .environment(viewModel)
}
