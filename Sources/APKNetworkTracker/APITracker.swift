//
//  File.swift
//  
//
//  Created by Pavankumar Arepu on 14/07/24.
//

import Foundation

public class APITracker {
    
    public static var isTrackingEnabled = false
    
    public static func startTracking() {
        if isTrackingEnabled {
            // Start listening to API calls
            // Example: URLProtocol implementation or other tracking logic
        }
    }
    
    public static func stopTracking() {
        // Stop API tracking
        // Example: Reset state, clear tracked data
    }
    
    public static func trackAPICall(request: URLRequest, response: HTTPURLResponse?, responseData: Data?) {
        if isTrackingEnabled {
            // Store the API call details
            //let apiCall = APICall(request: request, response: response, responseData: responseData)
            //APICallManager.shared.add(apiCall)
        }
    }
}
