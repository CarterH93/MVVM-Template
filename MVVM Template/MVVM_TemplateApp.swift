//
//  MVVM_TemplateApp.swift
//  MVVM Template
//
//  Created by Carter Hawkins on 12/26/24.
//

import SwiftUI

@main
struct MVVM_TemplateApp: App {
    @State private var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(viewModel)
        }
    }
}
