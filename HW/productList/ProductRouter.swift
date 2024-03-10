//
//  ProductRouter.swift
//  HW
//
//  Created by RMAD201 on 3/10/24.
//

import UIKit

protocol ProductRoutingLogic {
    func routeToDetail(productResponse : ProductResponse, selectedIndex : Int)
    func routeToProductOverview(product : Product)
}
class MainScreenRouter: NSObject, ProductRoutingLogic {

    weak var viewController : MainScreenViewController?
    
    func routeToDetail(productResponse: ProductResponse, selectedIndex: Int) {
        let detail = ViewControllerFactory.shared
        }
    
    func routeToProductOverview(product : Product) {
        
    }
}
