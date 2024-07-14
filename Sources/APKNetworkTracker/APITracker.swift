//
//  File.swift
//  
//
//  Created by Pavankumar Arepu on 14/07/24.
//

import Foundation

public class APITracker {
    
    public static var isTrackingEnabled = false
    
    private static var apiCalls: [APICall] = []
    
    public static func startTracking() {
        if isTrackingEnabled {
            URLProtocol.registerClass(APITrackingURLProtocol.self)
        }
    }
    
    public static func stopTracking() {
        URLProtocol.unregisterClass(APITrackingURLProtocol.self)
        clearTrackedData()
    }
    
    public static func trackAPICall(request: URLRequest, response: HTTPURLResponse?, responseData: Data?) {
        if isTrackingEnabled {
            let apiCall = APICall(request: request, response: response, responseData: responseData)
            add(apiCall)
        }
    }
    
    public static func getTrackedAPICalls() -> [APICall] {
        return apiCalls
    }
    
    private static func add(_ apiCall: APICall) {
        apiCalls.append(apiCall)
    }
    
    private static func clearTrackedData() {
        apiCalls.removeAll()
    }
}
