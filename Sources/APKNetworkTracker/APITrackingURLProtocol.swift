//
//  File.swift
//  
//
//  Created by Pavankumar Arepu on 14/07/24.
//
// Sources/APKNetworkTracker/APITrackingURLProtocol.swift

import Foundation

class APITrackingURLProtocol: URLProtocol {
    
    override class func canInit(with request: URLRequest) -> Bool {
        // Implement logic to filter which requests to intercept
        return APITracker.isTrackingEnabled
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        // Implement logic to track API request/response
        guard let client = self.client else { return }
        
        // Example: track request
        APITracker.trackAPICall(request: request, response: nil, responseData: nil)
        
        // Continue loading original request
        client.urlProtocolDidFinishLoading(self)
    }
    
    override func stopLoading() {
        // Optional: Implement logic to handle when loading is stopped
    }
}
