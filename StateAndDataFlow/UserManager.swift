//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 18.05.2022.
//

import Foundation
import SwiftUI

final class UserManager: ObservableObject {
    @Published var isRegistered = StorageManager.isRegistered
    var name = StorageManager.name
}
