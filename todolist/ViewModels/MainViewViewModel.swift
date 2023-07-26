//
//  MainViewViewModel.swift
//  todolist
//
//  Created by SHAHID AFRIDI SHAIK on 7/26/23.
//

import Foundation
import FirebaseAuth

class MainViewViewModel: ObservableObject{
    @Published var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init(){
        self.handler = Auth.auth().addStateDidChangeListener{ [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
        print("current user id \(currentUserId)")
    }
    
    public var isSignedIn: Bool{
        print(Auth.auth().currentUser?.uid ?? "not present")
        return Auth.auth().currentUser != nil
    }
}
