//
//  TodoListView.swift
//  todolist
//
//  Created by SHAHID AFRIDI SHAIK on 7/26/23.
//

import SwiftUI

struct TodoListView: View {
    var body: some View {
        NavigationView{
            VStack{
                
            }.navigationTitle("ToDo List")
                .toolbar{
                    Button{
                        // Action
                        NavigationLink("", destination: NewItemView())
                        
                    }label: {
                        Image(systemName: "plus")
                    }
                    
                }
        }
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView()
    }
}
