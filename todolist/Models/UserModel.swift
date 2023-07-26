//
//  UserModel.swift
//  todolist
//
//  Created by SHAHID AFRIDI SHAIK on 7/26/23.
//

import Foundation

struct UserModel:Codable{
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
