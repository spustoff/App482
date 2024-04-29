//
//  OrdersViewModel.swift
//  App482
//
//  Created by IGOR on 21/04/2024.
//

import SwiftUI
import CoreData

final class OrdersViewModel: ObservableObject {

    @Published var ordersStatus: [String] = ["Active orders", "Completed"]
    @Published var currentOS = "Active orders"
    
    @Published var balance1 = ""
    @Published var change1 = ""
    @AppStorage("balance") var balance: String = ""
    @AppStorage("change") var change: String = ""
    @AppStorage("SavedDirection") var SavedDirection = ""
    @AppStorage("CompletedOrders") var CompletedOrders: String = ""
    @AppStorage("TotalOrders") var TotalOrders: String = ""
    @AppStorage("WorkingHours") var WorkingHours: String = ""

    @Published var isAdd: Bool = false
    @Published var isDelete: Bool = false
    @Published var isDetail: Bool = false
    @Published var isEditBalance: Bool = false
    
    @Published var isGraphic: Bool = false
    @Published var isCurrencies: Bool = false
    
    @Published var isCompletedOrders: Bool = false
    @Published var isTotalOrders: Bool = false
    @Published var isWorkingHours: Bool = false
    
    @Published var directions: [String] = ["Up", "Down"]
    @Published var currentDirection = ""
    
    @Published var addCompletedOrders = ""
    @Published var addTotalOrders = ""
    @Published var addWorkingHours = ""
    
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
    
    @AppStorage("orders_completed") var orders_completed: [String] = []
    
    @Published var isFavoritedOrders: Bool = false
    
    func getFavoritedOrders() -> [OrdersModel] {

        return isFavoritedOrders ? orders.filter{orders_completed.contains($0.orderTitle ?? "")} : orders.filter{!orders_completed.contains($0.orderTitle ?? "")}
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
