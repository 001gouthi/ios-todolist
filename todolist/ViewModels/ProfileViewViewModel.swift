//
//  ProfileViewViewModel.swift
//  todolist
//
//  Created by SHAHID AFRIDI SHAIK on 7/26/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ProfileViewViewModel: ObservableObject{
    @Published var errorMsg: String
    var db:Firestore
    @Published var user: UserModel?
    
    init(){
        errorMsg = ""
        user = nil
        db = Firestore.firestore()
    }
    
    func signOut(){
        do{
            try Auth.auth().signOut()
        }catch{
            print(error)
        }
    }
    
    func fetchUser(){
        guard let userID = Auth.auth().currentUser?.uid else {
            errorMsg = "User not Found"
            return
        }
        
        db.collection("users")
            .document(userID).getDocument{ [weak self] snapshot,error in
                guard let data = snapshot?.data(),error == nil else {
                    return
                }
                DispatchQueue.main.async {
                    self?.user = UserModel(id: data["id"] as? String ?? "",
                                           name: data["name"] as? String ?? "",
                                           email: data["email"] as? String ?? "",
                                           joined: data["joined"] as? TimeInterval ?? 0)
                }
            }
            
    }
}
