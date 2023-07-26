//
//  todolistApp.swift
//  todolist
//
//  Created by SHAHID AFRIDI SHAIK on 7/25/23.
//

import SwiftUI
import FirebaseCore

@main
struct todolistApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
