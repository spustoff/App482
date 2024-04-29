//
//  AddOrder2.swift
//  App482
//
//  Created by IGOR on 21/04/2024.
//

import SwiftUI

struct AddOrder2: View {

    @StateObject var viewModel: OrdersViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            LinearGradient(colors: [Color.white, Color.white, Color.white, Color("prim").opacity(0.6), Color("prim2")], startPoint: .bottomLeading, endPoint: .topTrailing)
                .ignoresSafeArea()
            
            VStack {
                
                RoundedRectangle(cornerRadius: 5)
                    .fill(.gray)
                    .frame(width: 50, height: 6)
                
                ZStack {
                    
                    Text("Add order")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .semibold))
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.white)
                                .font(.system(size: 13, weight: .medium))
                                .padding(4)
                                .background(RoundedRectangle(cornerRadius: 5).fill(Color("prim")))
                        })
                        
                        Spacer()
                    }
                }
                .padding(.vertical)
                .padding(.bottom, 20)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(alignment: .leading, spacing: 12) {
                        
                        VStack(alignment: .leading, spacing: 5) {
                            
                            Text("Order Title")
                                .foregroundColor(.black.opacity(0.6))
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Example")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.orderTitle.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.orderTitle)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .semibold))
                                
                            })
                            .frame(maxWidth: .infinity)
                            .frame(height: 20)
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 20).stroke(.black))
                        .padding(1)

                        VStack(alignment: .leading, spacing: 5) {
                        
                            Text("Client Name")
                                .foregroundColor(.black.opacity(0.6))
                                .font(.system(size: 14, weight: .regular))

                            ZStack(alignment: .leading, content: {
                                
                                Text("Example")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.orderClient.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.orderClient)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .semibold))

                            })
                            .frame(maxWidth: .infinity)
                            .frame(height: 20)
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 20).stroke(.black))
                        .padding(1)

                        VStack(alignment: .leading, spacing: 5) {
                            
                            Text("Order Summary")
                                .foregroundColor(.black.opacity(0.6))
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Example")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.orderSummary.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.orderSummary)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .semibold))
                                
                            })
                            .frame(maxWidth: .infinity)
                            .frame(height: 20)
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 20).stroke(.black))
                        .padding(1)

                        VStack(alignment: .leading, spacing: 5) {
                                                    
                            Text("Order Value")
                                .foregroundColor(.black.opacity(0.6))
                                .font(.system(size: 14, weight: .regular))

                            ZStack(alignment: .leading, content: {
                                
                                Text("Example")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.orderValue.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.orderValue)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .semibold))

                            })
                            .frame(maxWidth: .infinity)
                            .frame(height: 20)
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 20).stroke(.black))
                        .padding(1)
                            
                        VStack(alignment: .leading, spacing: 5) {
                            
                            Text("Tags")
                                .foregroundColor(.black.opacity(0.6))
                                .font(.system(size: 14, weight: .regular))

                            ZStack(alignment: .leading, content: {
                                
                                Text("Example, Example")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.orderTags.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.orderTags)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .semibold))

                            })
                            .frame(maxWidth: .infinity)
                            .frame(height: 20)
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 20).stroke(.black))
                        .padding(1)
                            
                        VStack(alignment: .leading, spacing: 5) {
                            
                            Text("Completion Date")
                                .foregroundColor(.black.opacity(0.6))
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Example")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.orderCDate.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.orderCDate)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .semibold))
                                
                            })
                            .frame(maxWidth: .infinity)
                            .frame(height: 20)
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 20).stroke(.black))
                        .padding(1)

                    }
                }
            }
            .padding()
            
            VStack {
                
                Spacer()
            
                Button(action: {
                                                            
                    viewModel.addOrder()
                    
                    viewModel.orderTitle = ""
                    viewModel.orderClient = ""
                    viewModel.orderSummary = ""
                    viewModel.orderValue = ""
                    viewModel.orderTags = ""
                    viewModel.orderCDate = ""
                    
                    viewModel.fetchOrders()
                    
                    withAnimation(.spring()) {
                        
                        router.wrappedValue.dismiss()
                    }
                    
                }, label: {
                    
                    Text("Add")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                })
                .opacity(viewModel.orderTitle.isEmpty || viewModel.orderClient.isEmpty || viewModel.orderSummary.isEmpty || viewModel.orderValue.isEmpty || viewModel.orderTags.isEmpty || viewModel.orderCDate.isEmpty ? 0.5 : 1)
                .disabled(viewModel.orderTitle.isEmpty || viewModel.orderClient.isEmpty || viewModel.orderSummary.isEmpty || viewModel.orderValue.isEmpty || viewModel.orderTags.isEmpty || viewModel.orderCDate.isEmpty ? true : false)
            }
            .padding()
        }
    }
}
    
#Preview {
    AddOrder2(viewModel: OrdersViewModel())
}
