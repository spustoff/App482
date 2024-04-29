//
//  OrdersView.swift
//  App482
//
//  Created by IGOR on 19/04/2024.
//

import SwiftUI

struct OrdersView: View {

    @StateObject var viewModel = OrdersViewModel()
    
    var body: some View {

        ZStack {
            
            LinearGradient(colors: [Color("prim2"), Color("prim").opacity(0.7), Color("prim2").opacity(0.8)], startPoint: .bottomLeading, endPoint: .topTrailing)
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Image("file")
                        .padding(8)
                        .background(Circle().fill(Color.black))
                        .padding(5)
                        .background(Circle().fill(Color.black.opacity(0.4)))
                    
                    VStack(alignment: .leading) {
                        
                        Text("Your")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .semibold))
                        
                        Text("Orders")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .semibold))
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = true
                        }
                        
                    }, label: {
 
                            Text("Add")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                                .padding(8)
                                .padding(.horizontal, 7)
                                .background(RoundedRectangle(cornerRadius: 20).fill(Color.black))
                                .padding(5)
                                .background(RoundedRectangle(cornerRadius: 20).fill(Color.black.opacity(0.4)))

                    })
                }
                .padding()
                    
                    HStack {
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isWorkingHours = true
                            }
                            
                        }, label: {
                            
                            VStack(alignment:. leading) {
                                
                                VStack(alignment: .leading) {
                                    
                                    Image("persons")
                                        .foregroundColor(.white)
                                        .font(.system(size: 13, weight: .regular))
                                        .padding(6)
                                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.3)))
                                    
                                    Text("Working hours")
                                        .foregroundColor(.white)
                                        .font(.system(size: 12, weight: .medium))
                                    
                                }
                                
                                Spacer()
                                
                                Text("\(viewModel.WorkingHours)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .medium))
                                
                            }
                            .padding()
                            .frame(height: 206)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color("prim")))
                            .padding(.leading)
                        })
                        
                        VStack {
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isCompletedOrders = true
                                }
                                
                            }, label: {
                                
                                VStack(alignment:. leading) {
                                    
                                    HStack {
                                        
                                        Image("check")
                                            .foregroundColor(.white)
                                            .font(.system(size: 13, weight: .regular))
                                            .padding(6)
                                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.3)))
                                        
                                        Text("Completed orders")
                                            .foregroundColor(.white)
                                            .font(.system(size: 12, weight: .medium))
                                        
                                    }
                                    
                                    Spacer()
                                    
                                    Text("\(viewModel.CompletedOrders)")
                                        .foregroundColor(.white)
                                        .font(.system(size: 15, weight: .medium))
                                    
                                }
                                .padding()
                                .frame(height: 100)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(RoundedRectangle(cornerRadius: 20).fill(Color("prim2")))
                                .padding(.trailing)
                            })
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isTotalOrders = true
                                }
                                
                            }, label: {
                                
                                VStack(alignment:. leading) {
                                    
                                    HStack {
                                        
                                        Image("file")
                                            .foregroundColor(.white)
                                            .font(.system(size: 13, weight: .regular))
                                            .padding(6)
                                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.black.opacity(0.2)))
                                        
                                        Text("Total orders")
                                            .foregroundColor(.black.opacity(0.7))
                                            .font(.system(size: 12, weight: .medium))
                                        
                                    }
                                    
                                    Spacer()
                                    
                                    Text("\(viewModel.TotalOrders)")
                                        .foregroundColor(.black)
                                        .font(.system(size: 15, weight: .medium))
                                    
                                }
                                .padding()
                                .frame(height: 100)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
                                .padding(.trailing)
                            })
                        }
                    }

                VStack {
                    
                    HStack {
                        
                        ForEach(viewModel.ordersStatus, id: \.self) { index in
                            
                            Button(action: {
                                
                                viewModel.currentOS = index
                                
                                if viewModel.currentOS == "Completed" {
                                    
                                    viewModel.isFavoritedOrders = true
                                    
                                } else if viewModel.currentOS == "Active orders" {
                                    
                                    viewModel.isFavoritedOrders = false
                                }
                                
                            }, label: {
                                
                                Text(index)
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .regular))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 23)
                                    .background(RoundedRectangle(cornerRadius: 7).fill(viewModel.currentOS == index ? Color("prim") : Color.black))
                            })
                            
                        }
                    }
                    .padding(2)
                    .background(RoundedRectangle(cornerRadius: 7).fill(.black))
                    .padding(.bottom)
                    
                    if viewModel.orders.isEmpty {
                        
                        VStack {
                            
                            Text("Empty")
                                .foregroundColor(.black)
                                .font(.system(size: 18, weight: .semibold))
                            
                            Text("You don’t have any last orders")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                        }
                        .frame(maxHeight: .infinity)
                        
                    } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack(spacing: 10) {
                            
                            ForEach(viewModel.getFavoritedOrders(), id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.selectedOrder = index
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isDetail = true
                                    }
                                    
                                }, label: {
                                    
                                    HStack {
                                        
                                        VStack(alignment: .leading, spacing: 8) {
                                            
                                            Text("\(index.orderClient ?? "")")
                                                .foregroundColor(.black.opacity(0.5))
                                                .font(.system(size: 13, weight: .regular))
                                            
                                            Text("\(index.orderSummary ?? "")")
                                                .foregroundColor(.black)
                                                .font(.system(size: 18, weight: .medium))
                                            
                                            Text(index.orderTags ?? "")
                                                .foregroundColor(.white.opacity(0.7))
                                                .font(.system(size: 12, weight: .regular))
                                                .padding(4)
                                                .padding(.horizontal)
                                                .background(RoundedRectangle(cornerRadius: 5).fill(Color("prim2")))
                                            
                                        }
                                        
                                        Spacer()
                                        
                                        VStack(alignment: .trailing, spacing: 5) {
                                            
                                            Text(viewModel.isFavorited(index) ? "Completed" : "Active")
                                                .foregroundColor(Color("prim").opacity(0.6))
                                                .font(.system(size: 12, weight: .regular))
                                            
                                            Text("$\(index.orderValue ?? "")")
                                                .foregroundColor(.black)
                                                .font(.system(size: 18, weight: .medium))
                                            
                                        }
                                    }
                                })
                                .padding(.bottom, 8)
                            }
                        }
                    }
                }
            }
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(.white).ignoresSafeArea())
            }
        }
        .sheet(isPresented: $viewModel.isDetail, content: {

            DetailOrders2(viewModel: viewModel)
        })
        .onAppear {
            
            viewModel.fetchOrders()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddOrder2(viewModel: viewModel)
        })
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isCompletedOrders ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isCompletedOrders = false
                        }
                    }
                
                VStack {
                    
                    Text("Completed Orders")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()

                    ZStack(alignment: .leading, content: {
                        
                        Text("Completed Orders")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.addCompletedOrders.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.addCompletedOrders)
                            .foregroundColor(Color.black)
                            .font(.system(size: 16, weight: .semibold))

                    })
                    .padding(7)
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 2).fill(.white))
                    
                    HStack {
                        
                        Button(action: {
  
                            withAnimation(.spring()) {
                                
                                viewModel.isCompletedOrders = false
                                
                            }
                            
                        }, label: {
                            
                            Text("Cancel")
                                .foregroundColor(.red)
                                .font(.system(size: 18, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                            
                        })
                        
                        Button(action: {
                            
                            viewModel.CompletedOrders = viewModel.addCompletedOrders
                            
                            viewModel.addCompletedOrders = ""
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isCompletedOrders = false
                            }
                            
                        }, label: {
                            
                            Text("Save")
                                .foregroundColor(.blue)
                                .font(.system(size: 18, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                            
                        })
                    }
                }
                .frame(width: 300)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.white.opacity(0.7)))
                .padding()
                .offset(y: viewModel.isCompletedOrders ? 0 : UIScreen.main.bounds.height)
            }
        )
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isTotalOrders ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isTotalOrders = false
                        }
                    }
                
                VStack {
                    
                    Text("Total Orders")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()

                    ZStack(alignment: .leading, content: {
                        
                        Text("Total Orders")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.addTotalOrders.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.addTotalOrders)
                            .foregroundColor(Color.black)
                            .font(.system(size: 16, weight: .semibold))

                    })
                    .padding(7)
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 2).fill(.white))
                    
                    HStack {
                        
                        Button(action: {
  
                            withAnimation(.spring()) {
                                
                                viewModel.isTotalOrders = false
                                
                            }
                            
                        }, label: {
                            
                            Text("Cancel")
                                .foregroundColor(.red)
                                .font(.system(size: 18, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                            
                        })
                        
                        Button(action: {
                            
                            viewModel.TotalOrders = viewModel.addTotalOrders
                            
                            viewModel.addTotalOrders = ""
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isTotalOrders = false
                            }
                            
                        }, label: {
                            
                            Text("Save")
                                .foregroundColor(.blue)
                                .font(.system(size: 18, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                            
                        })
                    }
                }
                .frame(width: 300)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.white.opacity(0.7)))
                .padding()
                .offset(y: viewModel.isTotalOrders ? 0 : UIScreen.main.bounds.height)
            }
        )
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isWorkingHours ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isWorkingHours = false
                        }
                    }
                
                VStack {

                    Text("Working hours")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()

                    ZStack(alignment: .leading, content: {
                        
                        Text("Working hours")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.addWorkingHours.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.addWorkingHours)
                            .foregroundColor(Color.black)
                            .font(.system(size: 16, weight: .semibold))

                    })
                    .padding(7)
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 2).fill(.white))
                    
                    HStack {
                        
                        Button(action: {
  
                            withAnimation(.spring()) {
                                
                                viewModel.isWorkingHours = false
                                
                            }
                            
                        }, label: {
                            
                            Text("Cancel")
                                .foregroundColor(.red)
                                .font(.system(size: 18, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                            
                        })
                        
                        Button(action: {
                            
                            viewModel.WorkingHours = viewModel.addWorkingHours
                            
                            viewModel.addWorkingHours = ""
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isWorkingHours = false
                            }
                            
                        }, label: {
                            
                            Text("Save")
                                .foregroundColor(.blue)
                                .font(.system(size: 18, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                            
                        })
                    }
                }
                .frame(width: 300)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.white.opacity(0.7)))
                .padding()
                .offset(y: viewModel.isWorkingHours ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    OrdersView()
}
