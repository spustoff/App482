//
//  HomeViewModel.swift
//  App482
//
//  Created by IGOR on 19/04/2024.
//

import SwiftUI
import CoreData

final class HomeViewModel: ObservableObject {

    @Published var currencies: [String] = ["EUR/USD", "USD/JPY", "EUR/JPY", "AUD/USD", "USD/CAD", "USD/CHF", "NZD/USD"]
    @Published var currentCurrency = ""
    @AppStorage("pair") var pair = ""
    
    @Published var balance1 = ""
    @Published var change1 = ""
    @AppStorage("balance") var balance: String = ""
    @AppStorage("change") var change: String = ""
    @AppStorage("SavedDirection") var SavedDirection = ""
    @AppStorage("Earnings") var Earnings: String = ""
    @AppStorage("Courses") var Courses: String = ""
    @AppStorage("WorkingHours") var WorkingHours: String = ""
    @AppStorage("CompletedOrders") var CompletedOrders: String = ""
    @AppStorage("TotalOrders") var TotalOrders: String = ""
    @AppStorage("orders_completed") var orders_completed: [String] = []
    
    @Published var isEarnings: Bool = false
    @Published var isCourses: Bool = false
    @Published var isWorkingHours: Bool = false
    @Published var isEditBalance: Bool = false
    
    @Published var addEarnings = ""
    @Published var addCourses = ""
    @Published var addWorkingHours = ""
    
    @Published var isAdd: Bool = false
    @Published var isDelete: Bool = false
    @Published var isReset: Bool = false
    @Published var isDetail: Bool = false
    
    @Published var isGraphic: Bool = false
    @Published var isCurrencies: Bool = false
    
    @Published var directions: [String] = ["Up", "Down"]
    @Published var currentDirection = ""

    @Published var orderTitle = ""
    @Published var orderClient = ""
    @Published var orderSummary = ""
    @Published var orderValue = ""
    @Published var orderTags = ""
    @Published var orderCDate = ""
    @Published var orderStatus = ""

    @Published var orders: [OrdersModel] = []
    @Published var selectedOrder: OrdersModel?

    func addOrder() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "OrdersModel", into: context) as! OrdersModel

        loan.orderTitle = orderTitle
        loan.orderClient = orderClient
        loan.orderSummary = orderSummary
        loan.orderValue = orderValue
        loan.orderTags = orderTags
        loan.orderCDate = orderCDate
        loan.orderStatus = orderStatus

        CoreDataStack.shared.saveContext()
    }
    
    func fetchOrders() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<OrdersModel>(entityName: "OrdersModel")

        do {
            
            let result = try context.fetch(fetchRequest)
        
            self.orders = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.orders = []
        }
    }
    
    @Published var isFavoritedOrders: Bool = false
    
    func getFavoritedOrders() -> [OrdersModel] {

        return isFavoritedOrders ? orders : orders
    }
    
    func favoritesManager(_ audio: OrdersModel?) {
        
        guard let title = audio?.orderTitle else { return }
        
        if orders_completed.contains(title) {
            
            if let indexer = orders_completed.firstIndex(of: title) {
                
                orders_completed.remove(at: indexer)
            }
            
        } else {
            
            orders_completed.append(title)
        }
    }
    
    func isFavorited(_ audio: OrdersModel?) -> Bool {
        
        guard let title = audio?.orderTitle else { return false }
        
        return orders_completed.contains(title) ? true : false
    }
}
