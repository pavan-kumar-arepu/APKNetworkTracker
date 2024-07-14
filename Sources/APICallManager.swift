//
//  File.swift
//  
//
//  Created by Pavankumar Arepu on 14/07/24.
//

// Sources/APKNetworkTracker/APICallManager.swift

import Foundation

public class APICallManager {
    
    public static let shared = APICallManager()
    
    private(set) var apiCalls: [APICall] = []
    
    private init() {}
    
    func add(_ apiCall: APICall) {
        apiCalls.append(apiCall)
    }
}
