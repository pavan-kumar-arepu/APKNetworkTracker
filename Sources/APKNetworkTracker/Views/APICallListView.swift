//
//  File.swift
//  
//
//  Created by Pavankumar Arepu on 14/07/24.
//
// Sources/APKNetworkTracker/Views/APICallListView.swift

import SwiftUI

public struct APICallListView: View {
    
    var apiCalls: [APICall]
    @State private var selectedAPICall: APICall? = nil
    @State private var showAPICallDetails = false
    
    public var body: some View {
        NavigationView {
            List(apiCalls) { apiCall in
                Text("API Call \(apiCall.id)")
                    .onTapGesture {
                        self.selectedAPICall = apiCall
                        self.showAPICallDetails = true
                    }
            }
            .navigationTitle("API Calls")
            .sheet(isPresented: $showAPICallDetails, onDismiss: {
                self.selectedAPICall = nil
            }) {
                if let selectedAPICall = self.selectedAPICall {
                    APICallDetailView(apiCall: selectedAPICall)
                }
            }
        }
    }
}
