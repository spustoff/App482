//
//  R21.swift
//  App482
//
//  Created by IGOR on 19/04/2024.
//

import SwiftUI

struct R21: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            LinearGradient(colors: [Color("prim2"), Color("prim").opacity(0.7), Color("prim2").opacity(0.8)], startPoint: .bottomLeading, endPoint: .topTrailing)
                .ignoresSafeArea()
            
            VStack(spacing: 12) {
                
                VStack {
                    
                    Image("R2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .ignoresSafeArea()
                    
                }
                
                Text("Complete and create")
                    .foregroundColor(.white)
                    .font(.system(size: 22, weight: .semibold))
                
                Text("All of your orders in one place")
                    .foregroundColor(.white.opacity(0.6))
                    .font(.system(size: 15, weight: .regular))
                
                Spacer()
                
                Button(action: {
                    
                    status = true
                    
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
    R21()
}
