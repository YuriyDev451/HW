//
//  NetworkUtil.swift
//  HW
//
//  Created by RMAD201 on 3/10/24.
//

import Foundation

class NetworkUtil: NSObject {

}

enum HTTPMethod : String {
    case get = "GET"
    case post = "POST"
}

enum NetworkError : Error {
    case invalidURL
    case noData
    case decodingError
    case httpResponseError(statusCode : Int)
    case unknown(Error)
}

