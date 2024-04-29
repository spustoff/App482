//
//  HomeView.swift
//  App482
//
//  Created by IGOR on 19/04/2024.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Image("comp")
                        .padding(8)
                        .background(Circle().fill(Color.white))
                        .padding(5)
                        .background(Circle().fill(Color.white.opacity(0.4)))
                    
                    VStack(alignment: .leading) {
                        
                        Text("Your")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .semibold))
                        
                        Text("dashboard")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .semibold))
                    }
                    
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
                
                HStack {
                    
                    VStack(alignment: .leading, spacing: 6) {
                        
                        Image("semiaudi")
                        
                        Text("Balance")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                        
                        Spacer()
                        
                        Text("$\(viewModel.balance)")
                            .foregroundColor(.white)
                            .font(.system(size: 24, weight: .semibold))
                        
                        if viewModel.SavedDirection == "Up" {
                            
                            HStack {
                                
                                Text("+\(viewModel.change)")
                                    .foregroundColor(.green)
                                    .font(.system(size: 13, weight: .regular))
                                
                                Text("net worth")
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .regular))
                            }
                            
                        } else {
                            
                            HStack {
                                
                                Text("$\(viewModel.change)")
                                    .foregroundColor(.red)
                                    .font(.system(size: 13, weight: .regular))
                                
                                Text("net worth")
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .regular))
                            }
                        }
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isEditBalance = true
                        }
                        
                    }, label: {
                        
                        Image(systemName: "square.and.pencil")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))
                            .padding(9)
                            .background(Circle().fill(.white))
                    })
                    
                }
                .padding(20)
                .frame(maxWidth: .infinity)
                .frame(height: 170)
                .background(Image("vbg").resizable())
                .padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack {
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isEarnings = true
                            }
                            
                        }, label: {
                            
                            VStack {

                                    Image("TR")
                                        .padding(5)
                                        .background(RoundedRectangle(cornerRadius: 4).fill(Color.white.opacity(0.5)))
                                    
                                Text("$\(viewModel.Earnings.isEmpty ? "0" : viewModel.Earnings)")
                                        .foregroundColor(.white)
                                        .font(.system(size: 16, weight: .semibold))

                                Spacer()
                                
                                HStack {
                                    
                                    Text("+\(viewModel.Earnings)")
                                        .foregroundColor(.green)
                                        .font(.system(size: 13, weight: .medium))
                                    
                                    Text("from last order")
                                        .foregroundColor(.white.opacity(0.4))
                                        .font(.system(size: 8, weight: .medium))
                                }
                            }
                            .padding()
                            .frame(width: 150, height: 100)
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color("prim2")))
                            .padding(1)
                        })
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isCourses = true
                            }
                            
                        }, label: {
                            
                            VStack {

                                    Image("courses")
                                        .padding(5)
                                        .background(RoundedRectangle(cornerRadius: 4).fill(Color.white.opacity(0.5)))
                                    
                                Text("\(viewModel.Courses.isEmpty ? "0" : viewModel.Courses) courses")
                                        .foregroundColor(.white)
                                        .font(.system(size: 16, weight: .semibold))

                                Spacer()
                                
                                HStack {
                                    
                                    Text("+\(viewModel.Courses)")
                                        .foregroundColor(.white)
                                        .font(.system(size: 13, weight: .medium))
                                    
                                    Text("from last time")
                                        .foregroundColor(.white.opacity(0.4))
                                        .font(.system(size: 8, weight: .medium))
                                }
                            }
                            .padding()
                            .frame(width: 150, height: 100)
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color("prim")))
                            .padding(1)
                        })
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isWorkingHours = true
                            }
                            
                        }, label: {
                            
                            VStack {

                                    Image("hours")
                                        .padding(5)
                                        .background(RoundedRectangle(cornerRadius: 4).fill(Color.gray.opacity(0.5)))
                                    
                                Text("\(viewModel.WorkingHours.isEmpty ? "0" : viewModel.WorkingHours) hours")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .semibold))

                                Spacer()
                                
                                HStack {
                                    
                                    Text("+\(viewModel.WorkingHours)")
                                        .foregroundColor(Color("prim"))
                                        .font(.system(size: 13, weight: .medium))
                                    
                                    Text("from last time")
                                        .foregroundColor(.gray.opacity(0.5))
                                        .font(.system(size: 8, weight: .medium))
                                }
                            }
                            .padding()
                            .frame(width: 150, height: 100)
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
                            .padding(1)
                        })
                    }
                }
                .frame(height: 130)
                .padding(.leading)
                
                VStack {
                
                HStack {
                    
                    Text("Last orders")
                        .foregroundColor(.gray)
                        .font(.system(size: 16, weight: .semibold))
                    
                    Spacer()
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = true
                        }
                        
                    }, label: {
                        
                        Image(systemName: "plus.circle")
                            .foregroundColor(.gray)
                            .font(.system(size: 16, weight: .regular))
                    })
                    
                }
                .padding(.vertical)
                
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
            
            OrdersDetail(viewModel: viewModel)
        })
        .onAppear {
            
            viewModel.fetchOrders()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddingOrder(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isEditBalance, content: {
            
            EditingBalance(viewModel: viewModel)
        })
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isEarnings ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isEarnings = false
                        }
                    }
                
                VStack {
                    
                    Text("Earnings")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()

                    ZStack(alignment: .leading, content: {
                        
                        Text("Earnings")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.addEarnings.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.addEarnings)
                            .foregroundColor(Color.black)
                            .font(.system(size: 16, weight: .semibold))

                    })
                    .padding(7)
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 2).fill(.white))
                    
                    HStack {
                        
                        Button(action: {
  
                            withAnimation(.spring()) {
                                
                                viewModel.isEarnings = false
                                
                            }
                            
                        }, label: {
                            
                            Text("Cancel")
                                .foregroundColor(.red)
                                .font(.system(size: 18, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                            
                        })
                        
                        Button(action: {
                            
                            viewModel.Earnings = viewModel.addEarnings
                            
                            viewModel.addEarnings = ""
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isEarnings = false
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
                .offset(y: viewModel.isEarnings ? 0 : UIScreen.main.bounds.height)
            }
        )
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isCourses ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isCourses = false
                        }
                    }
                
                VStack {
                    
                    Text("Courses")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()

                    ZStack(alignment: .leading, content: {
                        
                        Text("Courses")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.addCourses.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.addCourses)
                            .foregroundColor(Color.black)
                            .font(.system(size: 16, weight: .semibold))

                    })
                    .padding(7)
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 2).fill(.white))
                    
                    HStack {
                        
                        Button(action: {
  
                            withAnimation(.spring()) {
                                
                                viewModel.isCourses = false
                                
                            }
                            
                        }, label: {
                            
                            Text("Cancel")
                                .foregroundColor(.red)
                                .font(.system(size: 18, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                            
                        })
                        
                        Button(action: {
                            
                            viewModel.Courses = viewModel.addCourses
                            
                            viewModel.addCourses = ""
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isCourses = false
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
                .offset(y: viewModel.isCourses ? 0 : UIScreen.main.bounds.height)
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
        .sheet(isPresented: $viewModel.isCurrencies, content: {
            
            CurrencyView(viewModel: viewModel)
        })
    }
}

#Preview {
    HomeView()
}
