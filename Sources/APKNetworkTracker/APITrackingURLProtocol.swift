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

        // Continue loading original request
        client.urlProtocolDidFinishLoading(self)
        
        // Example: track request
        APITracker.trackAPICall(request: request, response: nil, responseData: nil)
    }

    
    /*
    override func startLoading() {
      guard let client = self.client else { return }
      
      // Continue loading the original request
      let task = URLSession.shared.dataTask(with: request) { data, response, error in
      
        // Check for errors
        if let error = error {
          client.urlProtocol(self, didFailWithError: error)
          return
        }
        
        // Handle successful response
        client.urlProtocol(self, didReceive: response!, cacheStoragePolicy: .notAllowed) // Set cache policy (optional)
        client.urlProtocol(self, didLoad: data!)
        client.urlProtocolDidFinishLoading(self)
          
          // Track API call after receiving data and response
          APITracker.trackAPICall(request: self.request, response: response as! HTTPURLResponse, responseData: data)
          
      }
      task.resume()
    }
    */
    override func stopLoading() {
        // Optional: Implement logic to handle when loading is stopped
    }
}
