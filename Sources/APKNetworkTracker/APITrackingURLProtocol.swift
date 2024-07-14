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
        // Only intercept requests if tracking is enabled and request has not been handled
        return APITracker.isTrackingEnabled && URLProtocol.property(forKey: "MyURLProtocolHandledKey", in: request) == nil
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }

    override func startLoading() {
        // Mark the request as handled to avoid intercepting it again
        let newRequest = (self.request as NSURLRequest).mutableCopy() as! NSMutableURLRequest
        URLProtocol.setProperty(true, forKey: "MyURLProtocolHandledKey", in: newRequest)

        // Create a data task to fetch the request data
        let task = URLSession.shared.dataTask(with: newRequest as URLRequest) { data, response, error in
            if let error = error {
                self.client?.urlProtocol(self, didFailWithError: error)
                return
            }
            
            if let response = response {
                self.client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
            }
            
            if let data = data {
                self.client?.urlProtocol(self, didLoad: data)
                // Track the API call after receiving the data and response
                APITracker.trackAPICall(request: self.request, response: response as? HTTPURLResponse, responseData: data)
            }
            
            self.client?.urlProtocolDidFinishLoading(self)
        }
        
        task.resume()
    }
    
    override func stopLoading() {
        // Optional: Implement logic to handle when loading is stopped
    }
}
