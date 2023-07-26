//
//  LoginViewViewModel.swift
//  todolist
//
//  Created by SHAHID AFRIDI SHAIK on 7/26/23.
//

import Foundation
import FirebaseAuth

class LoginViewViewModel:ObservableObject {
    @Published var email:String = ""
    @Published var password:String = ""
    @Published var errorMsg:String = ""
    
    init() {
        
    }
    
    func login(){
        guard validate() else{
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password)
        
    }

    private func validate() -> Bool{
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,!password.trimmingCharacters(in: .whitespaces).isEmpty else{
            errorMsg = "Please fill all the fields."
            return false
        }
        guard email.contains("@") && email.contains(".") else {
            errorMsg = "Please enter a valid email Address"
            return false
        }
        
        return true

    }
}
