//
//  HeaderView.swift
//  todolist
//
//  Created by SHAHID AFRIDI SHAIK on 7/26/23.
//

import SwiftUI

struct HeaderView: View {
    @State var title:String = "Todo LIST APP "
    @State var tagline: String = "never forget a thing again"
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(Color.blue)
                .blur(radius: 10)
                .rotationEffect(Angle(degrees: 30))
            
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(Color.pink)
                .blur(radius: 10)
                .rotationEffect(Angle(degrees: -30))
            VStack{
                Text(title).foregroundColor(Color.white)
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                Text(tagline).foregroundColor(Color.white)
                    
            
            }
        }
        .frame(width: UIScreen.main.bounds.width*3,
               height: 300,alignment: .topTrailing)
      
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
