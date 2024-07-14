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
            URLProtocol.registerClass(APITrackingURLProtocol.self)
        }
    }
    
    public static func stopTracking() {
        URLProtocol.unregisterClass(APITrackingURLProtocol.self)
        APICallManager.shared.clear()
    }
    
    public static func trackAPICall(request: URLRequest, response: HTTPURLResponse?, responseData: Data?) {
        if isTrackingEnabled {
            let apiCall = APICall(request: request, response: response, responseData: responseData)
            APICallManager.shared.add(apiCall)
        }
    }
}
