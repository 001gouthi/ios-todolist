//
//  TodoListItemView.swift
//  todolist
//
//  Created by SHAHID AFRIDI SHAIK on 7/26/23.
//

import SwiftUI

struct TodoListItemView: View {
    var item:TodoListItem
    var body: some View {
        HStack{
            VStack(alignment:.leading){
                Text(item.title)
                    .fontWeight(.bold)
                    .font(.title2)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Button{
                //item.toggleIsDone(item.isDone)
            }label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill": "circle" )
            }
            
        }
    }
}

struct TodoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListItemView(item: TodoListItem(id: "", title: "get milk", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: true))
    }
}
