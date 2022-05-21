//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 18.05.2022.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject private var userManger: UserManager
    
    @State private var name = ""
    @State private var count = 0
    @State private var countColor = Color.red
    @State private var disabled = true
    
    var body: some View {
        VStack {
            HStack{
                TextField("Enter your name...", text: $name)
                    .multilineTextAlignment(.center)
                    .padding(.leading)
                    .onChange(of: name) { newValue in
                        
                        count = name.count
                        if name.count > 2 {
                            countColor  = Color.green
                            disabled = false
                        } else {
                            countColor  = Color.red
                            disabled = true
                        }
                    }
                Text("\(count)")
                    .padding(.trailing)
                    .foregroundColor(countColor)
            }

            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
            }
            .disabled(disabled)
        }
    }
    
    private func registerUser() {
        if !name.isEmpty {
            userManger.name = name
            userManger.isRegistered.toggle()
            StorageManager.save(username: name)
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
            .environmentObject(UserManager())
    }
}
