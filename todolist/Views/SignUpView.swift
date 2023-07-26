//
//  SignUpView.swift
//  todolist
//
//  Created by SHAHID AFRIDI SHAIK on 7/26/23.
//

import SwiftUI

struct SignUpView: View {
    
    @StateObject var viewModel: SignupViewViewModel = SignupViewViewModel()
    
    var body: some View {
        VStack{
            // Header
            HeaderView(title:"Register",tagline: "Start Organizing todos")
            
            //Form
            
            ZStack{
                RoundedRectangle(cornerRadius: 30)
                    .foregroundColor(Color.gray.opacity(0.2))
                    .frame(height:300)
                VStack{
                    // Full name
                    TextField("Full Name", text:$viewModel.name)
                        .foregroundColor(.black)
                        .textFieldStyle(.roundedBorder)
                        .autocorrectionDisabled()
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    
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
                        viewModel.signupUser()
                    }label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width:100, height:40)
                            Text("Sign Up")
                                .foregroundColor(Color.white)
                        }.padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing:0 ))
                    }
                    
                }
                .frame(width:UIScreen.main.bounds.width*0.8)
                .padding(EdgeInsets(top:0, leading:0, bottom: 0, trailing: 0))
            }
        }
        
        
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
