//
//  Not.swift
//  App482
//
//  Created by IGOR on 19/04/2024.
//

import SwiftUI

struct Not: View {

    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            LinearGradient(colors: [Color("prim2"), Color("prim").opacity(0.7), Color("prim2").opacity(0.8)], startPoint: .bottomLeading, endPoint: .topTrailing)
                .ignoresSafeArea()
            
            VStack(spacing: 12) {
                
                VStack {
                    
                    Image("Not")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .ignoresSafeArea()
                    
                }
                
                Text("Don't miss anything important")
                    .foregroundColor(.white)
                    .font(.system(size: 22, weight: .semibold))
                    .multilineTextAlignment(.center)
                
                Text("Get the most up-to-date information")
                    .foregroundColor(.white.opacity(0.6))
                    .font(.system(size: 15, weight: .regular))
                
                Spacer()
                
                Button(action: {
                    
                    status = true
                    
                }, label: {
                    
                    Text("Enable Notifications")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 30).fill(Color("prim")))
                })
                .padding()
            }
            
            VStack {
                
                Button(action: {
                    
                    status = true
                    
                }, label: {
                    
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                        .font(.system(size: 13, weight: .medium))
                        .padding(5)
                        .background(Circle().fill(.black))
                })
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()
                
                Spacer()
            }
        }
    }
}

#Preview {
    Not()
}
