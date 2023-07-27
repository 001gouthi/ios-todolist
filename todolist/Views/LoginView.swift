//
//  LoginView.swift
//  todolist
//
//  Created by SHAHID AFRIDI SHAIK on 7/26/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel: LoginViewViewModel = LoginViewViewModel()
    @State var winWidth = UIScreen.main.bounds.width
    @State var winHeight = UIScreen.main.bounds.height
    
    var body: some View {
        VStack{
            // Header
            HeaderView(title: "TodoList App",tagline: "Never Forget a thing Again")
                
            
            // Form
            ZStack{
                RoundedRectangle(cornerRadius: 30)
                    .foregroundColor(Color.gray.opacity(0.2))
                    .frame(height: winHeight * 0.5)
                
                VStack(spacing:20){
                    if !viewModel.errorMsg.isEmpty {
                        Text(viewModel.errorMsg).foregroundColor(Color.red)
                    }
                    Text("Login")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                    
                    //email field
                    TextField("Email", text:$viewModel.email)
                        .foregroundColor(.black)
                        .textFieldStyle(.roundedBorder)
                        .autocorrectionDisabled()
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    
                    
                    
                    // password field
                    SecureField("Password", text:$viewModel.password)
                        .textFieldStyle(.roundedBorder)
                        .autocorrectionDisabled()
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    
                    Button{
                        viewModel.login()
                        
                    }label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width:100, height:40)
                            Text("Login")
                                .foregroundColor(Color.white)
                        }.padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing:0 ))
                    }
                    
                }
                .padding(EdgeInsets(top:10, leading:0, bottom: 0, trailing: 0))
                .frame(width:winWidth*0.8)
            }
            
            //Create Account
            VStack{
                Text("New Around here?")
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)
                NavigationLink("Create an Account", destination: SignUpView())
                    .foregroundColor(.blue)
            }
        }
        .background(Color.black)
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)) // Adjust overall padding
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0,maxHeight: winHeight) // Fill the available space
            .background(Color.black)
            .edgesIgnoringSafeArea(.all) // Ignore safe area to cover the entire screen in landscape
            .onAppear {
                // Update screen dimensions on appear (for safe area changes in landscape)
                winWidth = UIScreen.main.bounds.width
                winHeight = UIScreen.main.bounds.height
            }
        
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
