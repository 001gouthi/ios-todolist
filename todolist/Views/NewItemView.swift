//
//  NewItemView.swift
//  todolist
//
//  Created by SHAHID AFRIDI SHAIK on 7/26/23.
//

import SwiftUI

struct NewItemView: View {
    @State var item: String = ""
    @State var dueDate: Date = Date()
    var body: some View {
        VStack{
            // Title
            Text("New Item")
            // Form
            Form {
                TextField("Add item", text: $item)
                // Date
                DatePicker("select the due Date",selection: $dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                // Save Button
            }
        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView()
    }
}
