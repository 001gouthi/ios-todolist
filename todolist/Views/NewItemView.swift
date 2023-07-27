//
//  NewItemView.swift
//  todolist
//
//  Created by SHAHID AFRIDI SHAIK on 7/26/23.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack{
            // Title
            Text("New Item")
                .font(.system(size: 30))
                .fontWeight(.semibold)
                .padding()
            // Form
            Form {
                TextField("title", text: $viewModel.item)
                    .lineLimit(nil)
                    .padding()
                // Date
                DatePicker("select the due Date",selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                // Save Button
                Button{
                    if viewModel.validateNewItem() {
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                    
                }label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color.blue)
                        Text("Add")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                    }
                }
            }
        }.padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0 ))
            .alert(isPresented: $viewModel.showAlert){
                Alert(title: Text("Error"),
                      message: Text("Please fill in all fields and select due dates."))
            }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView( newItemPresented: Binding(get: {
            return true
        }, set:{ _ in } ) )
    }
}
