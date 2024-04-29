//
//  OrdersDetail.swift
//  App482
//
//  Created by IGOR on 19/04/2024.
//

import SwiftUI

struct OrdersDetail: View {

    @StateObject var viewModel: HomeViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            LinearGradient(colors: [Color("prim2"), Color("prim"), Color.white], startPoint: .bottomLeading, endPoint: .topTrailing)
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text(viewModel.selectedOrder?.orderTitle ?? "")
                        .foregroundColor(.black)
                        .font(.system(size: 18, weight: .medium))
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.blue)
                                    .font(.system(size: 16, weight: .medium))
                                
                                Text("Back")
                                    .foregroundColor(.blue)
                                    .font(.system(size: 15, weight: .regular))
                                
                                
                            }
                        })
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = true
                            }
                            
                        }, label: {

                                Image(systemName: "trash.fill")
                                    .foregroundColor(.red)
                                    .font(.system(size: 16, weight: .medium))

                            })
                    }
                }
                .padding()
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(alignment: .leading, spacing: 6) {
                        
                        Text(viewModel.selectedOrder?.orderClient ?? "")
                            .foregroundColor(.black)
                            .font(.system(size: 20, weight: .semibold))
                        
                        Text("\(viewModel.selectedOrder?.orderTags ?? "") | \(viewModel.selectedOrder?.orderCDate ?? "")")
                            .foregroundColor(.black.opacity(0.7))
                            .font(.system(size: 15, weight: .regular))
                        
                        HStack {
                            
                            VStack(alignment:. leading) {
                                
                                HStack {
                                    
                                    Image(systemName: "chart.bar")
                                        .foregroundColor(.white)
                                        .font(.system(size: 13, weight: .regular))
                                        .padding(3)
                                        .background(RoundedRectangle(cornerRadius: 4).fill(Color("primary")))
                                    
                                    Text("Status")
                                        .foregroundColor(.white)
                                        .font(.system(size: 12, weight: .medium))
                                    
                                }
                                
                                Spacer()
                                
                                Text(viewModel.isFavorited(viewModel.selectedOrder) ? "Completed" : "Active")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .medium))
                                
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .frame(height: 100)
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color("prim")))
                            .padding(1)
                            
                            VStack(alignment:. leading) {
                                
                                HStack {
                                    
                                    Image(systemName: "creditcard")
                                        .foregroundColor(.white)
                                        .font(.system(size: 13, weight: .regular))
                                        .padding(3)
                                        .background(RoundedRectangle(cornerRadius: 4).fill(Color("primary")))
                                    
                                    Text("Fare")
                                        .foregroundColor(.white)
                                        .font(.system(size: 12, weight: .medium))
                                    
                                }
                                
                                Spacer()
                                
                                Text("$\(viewModel.selectedOrder?.orderValue ?? "")")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .medium))
                                
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .frame(height: 100)
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color("prim2")))
                            .padding(1)
                        }
                        .padding(.vertical)
                        
                        Text("Overview")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .medium))
                        
                        VStack(alignment: .leading) {
                            
                            Text("Order Summary")
                                .foregroundColor(.black.opacity(0.7))
                                .font(.system(size: 12, weight: .regular))

                            Text(viewModel.selectedOrder?.orderSummary ?? "")
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                            
                            Spacer()

                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(height: 150)
                        .background(RoundedRectangle(cornerRadius: 25).stroke(.black))
                        .padding(1)
                        
                        VStack(alignment: .leading) {
                            
                            Text("Tags")
                                .foregroundColor(.black.opacity(0.7))
                                .font(.system(size: 12, weight: .regular))

                            Text(viewModel.selectedOrder?.orderTags ?? "")
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                            
                            Spacer()

                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 25).stroke(.black))
                        .padding(1)
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color("bg2"))
                .ignoresSafeArea()
            }
            .overlay(
                
                ZStack {
                    
                    Color.black.opacity(viewModel.isDelete ? 0.5 : 0)
                        .ignoresSafeArea()
                        .onTapGesture {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                            }
                        }
                    
                    VStack {
                        
                        HStack {
                            
                            Spacer()
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isDelete = false
                                }
                                
                            }, label: {
                                
                                Image(systemName: "xmark")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .regular))
                            })
                        }
                        
                        Text("Delete")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .semibold))
                            .padding()
                        
                        Text("Are you sure you want to delete?")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .regular))
                            .multilineTextAlignment(.center)
                        
                        Button(action: {
                            
                            CoreDataStack.shared.deleteOrder(withOrderTitle: viewModel.selectedOrder?.orderTitle ?? "", completion: {
                                
                                viewModel.fetchOrders()
                            })
              
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                                viewModel.isDetail = false
                            }
                                    
                        }, label: {
                            
                            Text("Delete")
                                .foregroundColor(.red)
                                .font(.system(size: 18, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                            
                        })
                        .padding(.top, 25)
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                            }
                            
                        }, label: {
                            
                            Text("Cancel")
                                .foregroundColor(.blue)
                                .font(.system(size: 18, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                            
                        })
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 20).fill(Color.black))
                    .padding()
                    .offset(y: viewModel.isDelete ? 0 : UIScreen.main.bounds.height)
                }
            )
        }
    }
}

#Preview {
    OrdersDetail(viewModel: HomeViewModel())
}
