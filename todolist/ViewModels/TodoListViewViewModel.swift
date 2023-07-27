//
//  TodoListViewViewModel.swift
//  todolist
//
//  Created by SHAHID AFRIDI SHAIK on 7/26/23.
//

import Foundation
import FirebaseFirestore

class TodoListViewViewModel: ObservableObject {
    @Published var showNewItemView:Bool = false
    var db:Firestore
    private var userId: String
    init(userID: String){
        db = Firestore.firestore()
        self.userId = userID
    }
    
    func deleteItem(id:String){
        db.collection("users")
            .document(self.userId)
            .collection("todos")
            .document(id)
            .delete()
    }
    
}
