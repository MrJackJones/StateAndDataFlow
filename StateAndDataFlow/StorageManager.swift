//
//  StorageManager.swift
//  StateAndDataFlow
//
//  Created by Ivan on 21.05.2022.
//

import SwiftUI

class StorageManager {
    private init() {}
    
    @AppStorage("name") static var name = ""
    @AppStorage("isRegistered") static var isRegistered = false
    
    static func save(username: String) {
        name = username
        isRegistered.toggle()
    }
    
    static func delete() {
        name = ""
        isRegistered.toggle()
    }
}
