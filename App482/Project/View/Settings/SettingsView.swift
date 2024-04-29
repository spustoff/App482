//
//  SettingsView.swift
//  App482
//
//  Created by IGOR on 19/04/2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Image("privod")
                        .padding(8)
                        .background(Circle().fill(Color.white))
                        .padding(5)
                        .background(Circle().fill(Color.white.opacity(0.4)))
                    
                    Text("Settings")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .semibold))
                    
                    Spacer()
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isCurrencies = true
                        }
                        
                    }, label: {
                        
                        HStack {
                            
                            Text("\(viewModel.pair.isEmpty ? "USD" : viewModel.pair)")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                        }
                        .padding(8)
                        .padding(.horizontal, 7)
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
                        .padding(5)
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color.white.opacity(0.4)))
                    })
                }
                .padding()
                
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isReset = true
                    }
                    
                }, label: {
                    
                    Text("Reset progress")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                        .padding()
                })
                
                VStack {

                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack(spacing: 15) {
                            
                            Button(action: {
                                
                                guard let url = URL(string: DataManager().usagePolicy) else { return }
                                
                                UIApplication.shared.open(url)
                                
                            }, label: {
                                
                                Text("Usage Policy")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .regular))
                            })
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Rectangle()
                                .fill(.black.opacity(0.3))
                                .frame(maxWidth: .infinity)
                                .frame(height: 1)
                            
                            Button(action: {
                                
                                SKStoreReviewController.requestReview()
                                
                            }, label: {
                                
                                Text("Rate App")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .regular))
                            })
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 20).stroke(.black.opacity(0.3)))
                        .padding(1)
                    }
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(.white).ignoresSafeArea())
            }
        }
        .sheet(isPresented: $viewModel.isCurrencies, content: {
            
            CurrencyView(viewModel: viewModel)
        })
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isReset ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isReset = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isReset = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Reset progress")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                    
                    Text("Are you sure you want to reset progress?")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Button(action: {
                        
                        viewModel.balance = ""
                        viewModel.change = ""
                        viewModel.SavedDirection = ""
                        viewModel.Earnings = ""
                        viewModel.Courses = ""
                        viewModel.WorkingHours = ""
                        viewModel.CompletedOrders = ""
                        viewModel.TotalOrders = ""
                        viewModel.orders_completed.removeAll()
                        
                        CoreDataStack.shared.deleteAllData()
          
                        withAnimation(.spring()) {
                            
                            viewModel.isReset = false
                            
                        }
                                
                    }, label: {
                        
                        Text("Reset")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                    .padding(.top, 25)
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isReset = false
                        }
                        
                    }, label: {
                        
                        Text("Close")
                            .foregroundColor(.red)
                            .font(.system(size: 18, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("rbg")))
                .padding()
                .offset(y: viewModel.isReset ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    SettingsView()
}
