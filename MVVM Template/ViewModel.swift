//
//  ViewModel.swift
//  MVVM Template
//
//  Created by Carter Hawkins on 12/26/24.
//

import Foundation
import SwiftUI

//Use @Observable macro
@Observable class ViewModel {
    
    //Variables that can be accessed from anywhere in the app.
    var loggedIn = false
    
    //Can put functions and computed variables that can be used anywhere in the app
    var signInButtonDisabled: Bool {
        storage.password.isEmpty
    }
    
    
    func clearPassword() {
        storage.password = ""
    }
    
    
    /*
     Code below is for saving data to device
     Can Remove code below if using SwiftData
     
     */
    
    //Anything inside storage class will be saved to device automatically
    var storage: Storage = Storage() {
        
        //did set for saving data to the disk
        
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(storage) {
                
                let str = encoded
                let url = savePath
                
                do {
                    //AtomicWrite: This makes sure all the data is saved at once. Prevents missing data from occurring.
                    //CompleteFileProtection: Encryptes our data. Can remove if causing data access issues
                    try str.write(to: url, options: [.atomicWrite, .completeFileProtection])
                    
                } catch {
                    print(error.localizedDescription)
                }
            }
            
        }
    }
    
    //init for loading data from the disk
        init() {
            if let savedItems = try? Data(contentsOf: savePath) {
                if let decodedItems = try? JSONDecoder().decode(Storage.self, from: savedItems) {
                    storage = decodedItems
                    return
                }
            }
            storage = Storage()
        }
    
    
    //Helper info and functions for saving and retrieving data
    
    private static func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    
    private let savePath = getDocumentsDirectory().appendingPathComponent("SavedStorageData")
    
    //
     
}

 struct Storage: Codable {
    //Variables that data can be stored to anywhere in the app
    var userName = ""
    var password = ""
}
