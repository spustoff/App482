//
//  CurrencyView.swift
//  App482
//
//  Created by IGOR on 19/04/2024.
//

import SwiftUI

struct CurrencyView: View {
    
    @StateObject var viewModel: HomeViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Currencies")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .semibold))
                    
                    Button(action: {
                        
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        HStack {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 18, weight: .semibold))
                            
                            Text("Back")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 16, weight: .semibold))
                            
                            Spacer()
                        }
                    })
                    .frame(maxWidth: .infinity, alignment: .leading)

                }
                .padding(.bottom)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack(spacing: 15) {
                        
                        ForEach(viewModel.currencies, id: \.self) { index in
                        
                            Button(action: {
                                
                                viewModel.currentCurrency = index
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isGraphic = true
                                }
                                
                            }, label: {
                                
                                VStack {
                                    
                                    HStack {
                                        
                                        Text(index)
                                            .foregroundColor(.black)
                                            .font(.system(size: 18, weight: .semibold))
                                        
                                        Spacer()
                                        
                                        VStack(alignment: .trailing) {
                                            
                                            Text("\(String(format: "%.f", Double(.random(in: 1...9)))).\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 1...9))))")
                                                .foregroundColor(.black)
                                                .font(.system(size: 16, weight: .semibold))
                                            
                                            HStack {
                                                
                                                Text("+\(String(format: "%.f", Double(.random(in: 0...4)))).\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 1...9))))$")
                                                    .foregroundColor(.green)
                                                    .font(.system(size: 11, weight: .regular))
                                                
                                                Text("(\(String(format: "%.f", Double(.random(in: 1...3))))\(String(format: "%.f", Double(.random(in: 1...9)))).\(String(format: "%.f", Double(.random(in: 1...9))))%)")
                                                    .foregroundColor(.green)
                                                    .font(.system(size: 13, weight: .regular))
                                            }
                                        }
                                    }
                                   
                                    Rectangle()
                                        .fill(.gray.opacity(0.6))
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 1)
                                    
                                }
                            })
                        }
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 25).stroke(.black.opacity(0.3)))
                    .padding(1)
                }
                
            }
            .padding()
        }
        .sheet(isPresented: $viewModel.isGraphic, content: {
            
            ChartView(viewModel: viewModel)
        })
    }
}

#Preview {
    CurrencyView(viewModel: HomeViewModel())
}
