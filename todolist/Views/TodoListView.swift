//
//  TodoListView.swift
//  todolist
//
//  Created by SHAHID AFRIDI SHAIK on 7/26/23.
//

import SwiftUI
import FirebaseFirestoreSwift

struct TodoListView: View {
    @StateObject var viewModel = TodoListViewViewModel()
    @FirestoreQuery var items:[TodoListItem]
    
    init(_ userId:String){
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
    }
    func onDelete(){
        
    }
    var body: some View {
        NavigationView{
            
            VStack{
                List(items){item in
                    TodoListItemView(item: item)
                        .swipeActions{
                            Button(action: onDelete) {
                                Text("delete")
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                            }
                            .tint(Color.red)
                            
                        }
                }
                
            }.navigationTitle("ToDo List")
                .toolbar{
                    Button{
                        viewModel.showNewItemView = true
                        // Action
                        
                    }label: {
                        Image(systemName: "plus")
                    }
                }
                .sheet(isPresented:$viewModel.showNewItemView){  NewItemView(newItemPresented: $viewModel.showNewItemView)}
        }
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView("6tlQ6DoQlRFa5PBPF6s6")
    }
}
