//
//  TodoListItemViewViewModel.swift
//  todolist
//
//  Created by SHAHID AFRIDI SHAIK on 7/26/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class TodoListItemViewViewModel: ObservableObject{
    var db:Firestore
    init() {
        db = Firestore.firestore()
    }
    func toggleIsDone(item:TodoListItem){
        var newItem = item
        newItem.setIsDone(!item.isDone)
        
        guard let userID = Auth.auth().currentUser?.uid else {
            return
        }
        
        db.collection("users")
            .document(userID)
            .collection("todos")
            .document(item.id)
            .setData(newItem.asDcitionary())
        
        
    }
}
