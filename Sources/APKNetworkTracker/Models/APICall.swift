//
//  File.swift
//  
//
//  Created by Pavankumar Arepu on 14/07/24.
//

import Foundation

public struct APICall {
    public let request: URLRequest
    public let response: HTTPURLResponse?
    public let responseData: Data?
    
    public init(request: URLRequest, response: HTTPURLResponse?, responseData: Data?) {
        self.request = request
        self.response = response
        self.responseData = responseData
    }
}
