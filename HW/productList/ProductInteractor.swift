//
//  ProductInteractor.swift
//  HW
//
//  Created by RMAD201 on 3/10/24.
//

import UIKit

protocol ProductListBusinessLogic {
    func getList(request: ProductList.List.Request)
}

protocol ProductListDataStore {
    var productListResponse: ProductResponse? { get set }
}

class MainScreenInteractor: ProductListBusinessLogic, ProductListDataStore {
    var productListResponse: ProductResponse? = nil
    var presenter: MainScreenPresentationLogic?
    var worker: MainScreenWorker?
    
    func getList(request: ProductList.List.Request) {
        worker = MainScreenWorker()
        worker?.getList(completion: { response, error in
            self.productListResponse = response
            
            let presentationResponse = ProductList.List.Response(productListResponse: response)
            self.presenter?.present(response: presentationResponse)
        })
    }
}
