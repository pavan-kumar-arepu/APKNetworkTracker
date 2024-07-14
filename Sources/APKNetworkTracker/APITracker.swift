//
//  File.swift
//  
//
//  Created by Pavankumar Arepu on 14/07/24.
//

import Foundation
import UIKit

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
    
    public static func showAPICallModal() {
        let modalViewController = APICallModalViewController()
        
        // Example: Use a coordinator to present the modal view controller
        if let window = UIApplication.shared.windows.first {
            let rootViewController = window.rootViewController
            rootViewController?.present(modalViewController, animated: true, completion: nil)
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
