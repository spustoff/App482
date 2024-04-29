//
//  U1.swift
//  App482
//
//  Created by IGOR on 19/04/2024.
//

import SwiftUI

struct U1: View {
    var body: some View {

        ZStack {
            
            LinearGradient(colors: [Color("prim2"), Color("prim").opacity(0.7), Color("prim2").opacity(0.8)], startPoint: .bottomLeading, endPoint: .topTrailing)
                .ignoresSafeArea()
            
            VStack(spacing: 12) {
                
                VStack {
                    
                    Image("U1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .ignoresSafeArea()
                    
                }
                
                Text("Easy way to win")
                    .foregroundColor(.white)
                    .font(.system(size: 22, weight: .semibold))
                
                Text("Growth without boundaries")
                    .foregroundColor(.white.opacity(0.6))
                    .font(.system(size: 15, weight: .regular))
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    Reviews()
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    Text("Next")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 30).fill(Color("prim")))
                })
                .padding()
            }
        }
    }
}

#Preview {
    U1()
}
