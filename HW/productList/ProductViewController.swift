//
//  ProductViewController.swift
//  HW
//
//  Created by RMAD201 on 3/10/24.
//

import UIKit

protocol ProductDisplayL: AnyObject {
    func displayList(viewModel: ProductList.List.ViewModel)
}

class MainScreenViewController: UIViewController, ProductDisplayL {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    let cellIdentifier = "ProductsTableViewCell"
    var rows = [ProductList.Rows]()
    
    var interactor: (ProductListBusinessLogic & ProductListDataStore)?
    var router: ProductRoutingLogic?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cell = UINib(nibName: "ProductsTableViewCell", bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: cellIdentifier)
        
        getList()
    }

    func displayList(viewModel: ProductList.List.ViewModel) {
        rows = viewModel.rows
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func getList() {
        let request = ProductList.List.Request(pageIndex: 1, pageItemCount: 10)
        interactor?.getList(request: request)
    }
}

extension MainScreenViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = rows[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: data.identifier(), for: indexPath) as? ProductCellProtocol {
            
            switch data {
            case .empty:
                break
            case .product(let product):
                cell.configure(productData: product)
                break
            }
            
            return cell as! UITableViewCell
        }
        
        return UITableViewCell()
    }
}

extension MainScreenViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         
        if let response = interactor?.productListResponse {
            router?.routeToDetail(productResponse: response, selectedIndex: indexPath.row)

        }
    
    }
}
