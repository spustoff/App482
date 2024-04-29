//
//  EditingBalance.swift
//  App482
//
//  Created by IGOR on 19/04/2024.
//

import SwiftUI

struct EditingBalance: View {

    @StateObject var viewModel: HomeViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            LinearGradient(colors: [Color("prim2"), Color("prim").opacity(0.7), Color("prim2").opacity(0.8)], startPoint: .bottomLeading, endPoint: .topTrailing)
                .ignoresSafeArea()
            
            VStack {
                
                RoundedRectangle(cornerRadius: 5)
                    .fill(.gray)
                    .frame(width: 50, height: 6)
                
                ZStack {
                    
                    Text("Edit Balance")
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
                        
                        VStack(alignment: .leading) {
                            
                            Text("Balance")
                                .foregroundColor(.black.opacity(0.7))
                                .font(.system(size: 14, weight: .regular))

                            ZStack(alignment: .leading, content: {
                                
                                Text("Expample")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.balance1.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.balance1)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .semibold))

                            })
                            .frame(maxWidth: .infinity)
                            .frame(height: 20)

                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 20).stroke(.black))
                        .padding(1)
                        
                        VStack(alignment: .leading) {
                            
                            Text("Change")
                                .foregroundColor(.black.opacity(0.7))
                                .font(.system(size: 14, weight: .regular))

                            ZStack(alignment: .leading, content: {
                                
                                Text("Example")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.change1.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.change1)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .semibold))

                            })
                            .frame(maxWidth: .infinity)
                            .frame(height: 20)

                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 25).stroke(.black))
                        .padding(1)
                        
                        VStack(alignment: .leading) {
                            
                            Text("Direction")
                                .foregroundColor(.black.opacity(0.7))
                                .font(.system(size: 14, weight: .regular))

                            Menu(content: {
                                
                                ForEach(viewModel.directions, id: \.self) { index in
                                    
                                Button(action: {
                                    
                                    viewModel.currentDirection = index
                                    
                                }, label: {
                                    
                                    Text(index)
                                })
                                }
                                
                            }, label: {
                                
                                if viewModel.currentDirection.isEmpty {
                                    
                                    HStack {
                                        
                                        Text("Choose")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 14, weight: .regular))
                                        
                                        Spacer()
                                        
                                        Image(systemName: "chevron.up.chevron.down")
                                            .foregroundColor(.black)
                                            .font(.system(size: 16, weight: .regular))
                                    }
                                    
                                } else {
                                    
                                    HStack {
                                        
                                        Text(viewModel.currentDirection)
                                            .foregroundColor(Color.black)
                                            .font(.system(size: 16, weight: .semibold))
                                        
                                        Spacer()
                                        
                                        Image(systemName: "chevron.up.chevron.down")
                                            .foregroundColor(.black)
                                            .font(.system(size: 16, weight: .regular))
                                    }
                                }
                            })
                            .frame(maxWidth: .infinity)
                            .frame(height: 20)
                            
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 25).fill(.white))
                        
                    }
                }
            }
            .padding()
            
            VStack {
                
                Spacer()
            
                Button(action: {
                                        
                    viewModel.SavedDirection = viewModel.currentDirection
                    viewModel.balance = viewModel.balance1
                    viewModel.change = viewModel.change1

                    viewModel.balance1 = ""
                    viewModel.change1 = ""
                    viewModel.currentDirection = ""

                    withAnimation(.spring()) {
                        
                        router.wrappedValue.dismiss()
                    }
                    
                }, label: {
                    
                    Text("Save")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color("prim")))
                })
                .opacity(viewModel.currentDirection.isEmpty || viewModel.balance1.isEmpty || viewModel.change1.isEmpty ? 0.5 : 1)
                .disabled(viewModel.currentDirection.isEmpty || viewModel.balance1.isEmpty || viewModel.change1.isEmpty ? true : false)
            }
            .padding()
        }
    }
}

#Preview {
    EditingBalance(viewModel: HomeViewModel())
}
