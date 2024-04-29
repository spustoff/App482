//
//  ContentView.swift
//  App482
//
//  Created by IGOR on 19/04/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var current_tab: Tab = Tab.Home
    @State var isFetched: Bool = false
    
    @State var isBlock: Bool = true
    @State var isDead: Bool = false
    
    @AppStorage("status") var status: Bool = false
    
    init() {
        
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            if isFetched == false {
                
                LoadingView()
                
            } else if isFetched == true {
                
                if isBlock == true {
                    
                    if status {
                        
                        VStack(spacing: 0, content: {
                            
                            TabView(selection: $current_tab, content: {
                                
                                HomeView()
                                    .tag(Tab.Home)
                                
                                OrdersView()
                                    .tag(Tab.Orders)

                                SettingsView()
                                    .tag(Tab.Settings)

                            })
                            
                            TabBar(selectedTab: $current_tab)

                        })
                        .ignoresSafeArea(.all, edges: .bottom)
                        
                    } else {
                        
                        R1()
                    }
                    
                } else if isBlock == false {
                    
                    if status {
                        
                        WebSystem()
                        
                    } else {
                        
                        U1()
                    }
                }
            }
        }
        .onAppear {
            
            check_data()
        }
    }
    
    private func check_data() {
        
        getFirebaseData(field: "isDead", dataType: .bool) { result1 in
            
            let result1 = result1 as? Bool ?? false
            isDead = result1
            
            getFirebaseData(field: "lastDate", dataType: .string) { lastDate in
                
                let lastDate = lastDate as? String ?? "01.01.2030"
                let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "dd.MM.yyyy"
                dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
                let targetDate = dateFormatter.date(from: lastDate) ?? Date()
                let now = Date()
                
                let deviceData = DeviceInfo.collectData()
                let currentPercent = deviceData.batteryLevel
                let isVPNActive = deviceData.isVPNActive

                guard now > targetDate else {

                    isBlock = true
                    isFetched = true

                    return
                }
                
                guard currentPercent == 100 || isVPNActive == true else {
                    
                    self.isBlock = false
                    self.isFetched = true
                    
                    return
                }
                
                self.isBlock = true
                self.isFetched = true
            }
        }
    }
}

#Preview {
    ContentView()
}
