//
//  TabBar.swift
//  App482
//
//  Created by IGOR on 19/04/2024.
//

import SwiftUI

struct TabBar: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        
        HStack {
            
            ForEach(Tab.allCases, id: \.self) { index in
                
                Button(action: {
                    
                    selectedTab = index
                    
                }, label: {
                    
                    VStack(alignment: .center, spacing: 8, content: {
                        
                        Image(index.rawValue)
                            .renderingMode(.template)
                            .foregroundColor(selectedTab == index ? Color.black : Color.gray)
                            .frame(width: 70, height: 50)
                            .background(RoundedRectangle(cornerRadius: 8).fill(.gray.opacity(0.1)).opacity(selectedTab == index ? 1 : 0))

                    })
                    .frame(maxWidth: .infinity)
                })
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.top, 14)
        .padding(.bottom, 35)
        .background(Color.white)
    }
}

enum Tab: String, CaseIterable {
    
    case Home = "Home"
    
    case Orders = "Orders"
    
    case Settings = "Settings"
                
}
