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
    
    @Published public private(set) var apiCalls: [APICall] = []
    
    public func add(_ apiCall: APICall) {
        apiCalls.append(apiCall)
    }
    
    public func clear() {
        apiCalls.removeAll()
    }
    
    private func fetchAPIcalls() {
        print("Fetching API calls...")
        self.apiCalls = APICallManager.shared.apiCalls
        print("API calls count: \(self.apiCalls.count)")
    }

}
