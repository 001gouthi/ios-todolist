//
//  NewItemViewViewModel.swift
//  todolist
//
//  Created by SHAHID AFRIDI SHAIK on 7/26/23.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth


class NewItemViewViewModel : ObservableObject {
    @Published var item: String = ""
    @Published var dueDate: Date = Date()
    @Published var showAlert: Bool = false
    init(){}
    
    func save(){
        guard validateNewItem() else {
            return
        }
        
        guard Auth.auth().currentUser?.uid != nil else {
            return
        }
        
        // create model
        let uid = UUID().uuidString
        let item = TodoListItem(id: uid,
                                title: item,
                                dueDate: dueDate.timeIntervalSince1970,
                                createdDate: Date().timeIntervalSince1970,
                                isDone: false)
        
        // save Model
        let db = Firestore.firestore()
        
        db.collection("users")
            .document()
            .collection("todos")
            .document(uid)
            .setData(item.asDcitionary())
        
        
    }
    
    func validateNewItem() -> Bool {
        guard !item.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
}
