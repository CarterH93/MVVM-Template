//
//  UserInputs.swift
//  MVVM Template
//
//  Created by Carter Hawkins on 12/26/24.
//

import SwiftUI

struct UserInputs: View {
    @Environment(ViewModel.self) private var viewModel
    var body: some View {
        //Allows bindings to be used. Only include if necessary
        @Bindable var viewModel = viewModel
        
        TextField("UserName", text: $viewModel.storage.userName)
        TextField("Password", text: $viewModel.storage.password)
    }
}

#Preview {
    @Previewable @State var viewModel = ViewModel()
    UserInputs()
        .environment(viewModel)
}
