//
//  ProductWorker.swift
//  HW
//
//  Created by RMAD201 on 3/10/24.
//

import UIKit

class MainScreenWorker {
    func getList(completion: @escaping ((ProductResponse?, NetworkError?))->Void) {
       let url = "https://dummyjson.com/products"
        NetworkManager.shared.fetchData(from: url, method: .get, body: nil) { (result : Result<ProductResponse, NetworkError>)  in
            switch result {
                case .success(let productResponse) :
                    completion((productResponse, nil))
                    break
                case .failure(let error) :
                    completion((nil, error))
                    break
            }
        }
    }
}

