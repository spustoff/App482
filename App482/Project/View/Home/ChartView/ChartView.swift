//
//  ChartView.swift
//  App482
//
//  Created by IGOR on 19/04/2024.
//

import SwiftUI

struct ChartView: View {
    
    @StateObject var viewModel: HomeViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg3")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("\(viewModel.currentCurrency)")
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
                
                Text("\(viewModel.pair)")
                    .foregroundColor(.black.opacity(0.6))
                    .font(.system(size: 16, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack {
                    
                    Text("\(String(format: "%.f", Double(.random(in: 0...4)))).\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 1...9))))")
                        .foregroundColor(.black)
                        .font(.system(size: 26, weight: .semibold))
                                        
                    Text("+\(String(format: "%.f", Double(.random(in: 1...9)))).\(String(format: "%.f", Double(.random(in: 1...9))))%")
                        .foregroundColor(Color("prim"))
                        .font(.system(size: 13, weight: .medium))
                        .frame(width: 70, height: 25)
                        .background(RoundedRectangle(cornerRadius: 5).fill(Color("prim").opacity(0.4)))
                    
                    Spacer()

                }
                .padding(.vertical)
                
                Image("graph")
                    .resizable()
                    .padding(.bottom, 30)
                
                HStack {
                    
                    Button(action: {
                        
                        viewModel.pair = viewModel.currentCurrency
      
                            viewModel.isGraphic = false

                            viewModel.isCurrencies = false
                            
                    }, label: {
                        
                        Text("Apply")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                    })
                    
                    Button(action: {
                        
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        Text("Close")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(.red.opacity(0.6)))
                    })
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    ChartView(viewModel: HomeViewModel())
}
