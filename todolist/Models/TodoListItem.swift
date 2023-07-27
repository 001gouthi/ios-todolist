//
//  TodoListItem.swift
//  todolist
//
//  Created by SHAHID AFRIDI SHAIK on 7/26/23.
//

import Foundation

struct TodoListItem:Codable,Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setIsDone(_ state: Bool){
        isDone = state
    }
    
    mutating func toggleIsDone(_ done:Bool){
        isDone = !done
    }
    
}
