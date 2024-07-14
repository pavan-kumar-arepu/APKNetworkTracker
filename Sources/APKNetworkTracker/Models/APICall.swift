//
//  File.swift
//  
//
//  Created by Pavankumar Arepu on 14/07/24.
//

// Sources/APKNetworkTracker/Models/APICall.swift

import Foundation

public struct APICall: Identifiable {
    public let id: UUID  // Unique identifier
    
    public let request: URLRequest
    public let response: HTTPURLResponse?
    public let responseData: Data?
    
    public init(request: URLRequest, response: HTTPURLResponse?, responseData: Data?) {
        self.id = UUID()  // Assign a unique identifier
        self.request = request
        self.response = response
        self.responseData = responseData
    }
}
