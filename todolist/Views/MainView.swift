//
//  ContentView.swift
//  todolist
//
//  Created by SHAHID AFRIDI SHAIK on 7/25/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    var body: some View {
        NavigationView{
            if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
                TabView{
                    TodoListView("6tlQ6DoQlRFa5PBPF6s6")
                        .tabItem{
                            Label("Home", systemImage:"house")
                        }
                    ProfileView()
                        .tabItem{
                            Label("Profile", systemImage: "person.circle")
                        }
                }
            }else{
                LoginView()
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
