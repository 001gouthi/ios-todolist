//
//  SignUpViewViewModel.swift
//  todolist
//
//  Created by SHAHID AFRIDI SHAIK on 7/26/23.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class SignupViewViewModel: ObservableObject {
    @Published var email:String = ""
    @Published var password:String = ""
    @Published var name:String = ""
    @Published var errorMsg:String = ""
    
    init(){}
    
    func signupUser(){
        guard validate() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password){ [weak self] result, error in
            guard let userId = result?.user.uid else {
                let errorm = error?.localizedDescription ?? "UNKNOWN ERROR: Registration Failed"
                self?.errorMsg = errorm
                return
            }
            
            self?.insertUserRecord(id: userId)
        }
    }
    
    private func insertUserRecord(id:String){
        
        let newUser: UserModel = UserModel(id: id,
                                           name: name,
                                           email: email,
                                           joined: Date().timeIntervalSince1970)
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDcitionary())
        
    }
    
    private func validate() -> Bool {
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty,
              !name.trimmingCharacters(in: .whitespaces).isEmpty
        else{
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
