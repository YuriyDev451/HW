//
//  ViewControllerFactory.swift
//  HW
//
//  Created by RMAD201 on 3/10/24.
//

import Foundation
import UIKit

class ViewControllerFactory {

    static var shared: ViewControllerFactory = ViewControllerFactory()
    
   
    
    func makeProductListController() -> UIViewController {
        let productListController = MainScreenViewController(nibName: "MainScreenViewController", bundle: Bundle.main)
      
        let interactor = MainScreenInteractor()
        let presenter = MainScreenPresenter()
        let router = MainScreenRouter()
        
        productListController.interactor = interactor
        productListController.router = router
        
        interactor.presenter = presenter
        presenter.viewController = productListController
        
        router.viewController = productListController
        
        return productListController
    }
    
    
//    func makeProductDetail(productDetailResponse : ProductResponse, selectedIndex : Int) -> UIViewController {
//        let details = DetailsScreenViewController(nibName: "DetailsScreenViewController", bundle: Bundle.main)
//        let interactor = DetailsScreenInteractor()
//        let presenter = DetailsScreenPresenter()
//        let router = MainScreenRouter()
//        
//        details.interactor = interactor
//        details.router = router
//        
//        interactor.presenter = presenter
//        interactor.productListResponse = productDetailResponse
//        interactor.selectedItem = selectedIndex
//        
//        presenter.viewController = details
//        router.viewController = details
//        router.dataStore = interactor
//        
//        return details
//    }
    
}
