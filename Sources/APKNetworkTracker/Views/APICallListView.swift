//
//  File.swift
//  
//
//  Created by Pavankumar Arepu on 14/07/24.
//
// Sources/APKNetworkTracker/Views/APICallListView.swift


import Foundation
import SwiftUI

@available(iOS 13.0, *)
public struct APICallListView: View {
    
    @State private var selectedAPICall: APICall? = nil
    
    public var body: some View {
        VStack {
            Text("Tracked API Calls")
                .font(.title)
                .padding()
            
            List(APICallManager.shared.apiCalls) { apiCall in
                Button(action: {
                    self.selectedAPICall = apiCall
                }) {
                    Text("API Call Details")
                }
            }
            .sheet(item: $selectedAPICall) { apiCall in
                APICallDetailView(apiCall: apiCall)
            }
        }
    }
}
