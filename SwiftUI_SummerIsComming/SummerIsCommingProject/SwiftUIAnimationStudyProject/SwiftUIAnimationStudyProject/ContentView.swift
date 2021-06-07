//
//  ContentView.swift
//  SwiftUIAnimationStudyProject
//
//  Created by 김우성 on 2021/06/08.
//

import SwiftUI

struct ContentView: View {
    
    @State var show = false
    
    var body: some View {
        
        VStack {
            
            Text("Summer is coming")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(Color.black)
                .padding(4)
            
            Image("summerisComming")
                .resizable()
                .frame(width: show ? 414 : 300,
                       height: show ? 600 : 300)
                .clipped()
                .shadow(radius: 30)
                .blur(radius: show ? 0 : 30)
                .animation(.spring())
            
            Text("focused on Summer")
                .font(.subheadline)
                .fontWeight(.regular)
                .foregroundColor(Color.gray)
                .scaleEffect(show ? 2 : 1)
                .animation(.spring())
                .padding(4)
            
            Button(action: {
                withAnimation { 
                    self.show.toggle()
                }
            }, label: {
                Text("Animate")
            })
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
