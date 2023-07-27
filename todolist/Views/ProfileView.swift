//
//  ProfileView.swift
//  todolist
//
//  Created by SHAHID AFRIDI SHAIK on 7/26/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel:ProfileViewViewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            if let user = viewModel.user {
                VStack{
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100,height: 100)
                    
                    
                    VStack(alignment: .leading){
                        HStack{
                            Text("Name :")
                            Text(user.name)
                                .fontWeight(.bold)
                                .font(.body)
                        }.padding()
                        
                        HStack{
                            Text("Email :")
                            Text(user.email)
                                .fontWeight(.bold)
                                .font(.body)
                        }.padding()
                        
                        HStack{
                            Text("Joined :")
                            Text("\(Date(timeIntervalSince1970:user.joined ).formatted(date: .abbreviated, time: .shortened))")
                                .fontWeight(.bold)
                                .font(.body)
                        }.padding()
                        
                        
                    }.padding()
                    
                    Button{
                        viewModel.signOut()
                    }label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.red)
                            Text("Sign Out")
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                            
                        }.frame(width:100, height:50)
                    }
                }.navigationTitle("Profile")
                    .padding(EdgeInsets(top: 30, leading: 0, bottom: 0, trailing: 0))
                    
            }
            else{
                VStack{
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint:.blue))
                        .scaleEffect(3)
                        .padding()
                    Text("Loading Profile...")
                        .font(.system(size: 20))
                        .padding()
                }
            }
        }.onAppear{
            viewModel.fetchUser()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
