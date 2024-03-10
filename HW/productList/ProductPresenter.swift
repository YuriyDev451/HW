//
//  ProductPresenter.swift
//  HW
//
//  Created by RMAD201 on 3/10/24.
//
import UIKit

protocol MainScreenPresentationLogic {
    func present(response: ProductList.List.Response)
}

class MainScreenPresenter: MainScreenPresentationLogic {
    
    weak var viewController: ProductDisplayL?

    func present(response: ProductList.List.Response) {
        var cells: [ProductList.Rows] = []

        let products = response.productListResponse?.products
        if products?.isEmpty == true {
            cells.append(ProductList.Rows.empty)
        } else {
            products?.forEach { product in
                let productData = ProductUIData(product: product)
                cells.append(ProductList.Rows.product(product: productData))
            }
        }

        let viewModel = ProductList.List.ViewModel(rows: cells)
        viewController?.displayList(viewModel: viewModel)
    }
}
