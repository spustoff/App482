//
//  R1.swift
//  App482
//
//  Created by IGOR on 19/04/2024.
//

import SwiftUI

struct R1: View {
    var body: some View {

        ZStack {
            
            LinearGradient(colors: [Color("prim2"), Color("prim").opacity(0.7), Color("prim2").opacity(0.8)], startPoint: .bottomLeading, endPoint: .topTrailing)
                .ignoresSafeArea()
            
            VStack(spacing: 12) {
                
                VStack {
                    
                    Image("R1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .ignoresSafeArea()
                    
                }
                
                Text("Explore your results!")
                    .foregroundColor(.white)
                    .font(.system(size: 22, weight: .semibold))
                
                Text("Keep your results close to yourself")
                    .foregroundColor(.white.opacity(0.6))
                    .font(.system(size: 15, weight: .regular))
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    R21()
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
    R1()
}
