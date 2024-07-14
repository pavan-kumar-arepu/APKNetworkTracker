//
//  File.swift
//  
//
//  Created by Pavankumar Arepu on 14/07/24.
//
// Sources/APKNetworkTracker/Views/APICallListView.swift

import SwiftUI
public struct APICallModalView: View {
    
    
    @Environment(\.presentationMode) private var presentationMode
    @State private var apiCalls: [APICall] = []
    
    public init() {}
    
    public var body: some View {
        NavigationView {
            List(apiCalls) { apiCall in
                NavigationLink(destination: APICallDetailView(apiCall: apiCall)) {
                    Text("API Call \(apiCall.request)")
                        .foregroundColor(apiCall.response?.statusCode == 200 ? .green : .red)
                }
                .listRowBackground(apiCall.response?.statusCode == 200 ? Color.green.opacity(0.3) : Color.red.opacity(0.3))
            }
            .navigationTitle("API Calls")
            .navigationBarItems(trailing: Button("Close") {
                self.presentationMode.wrappedValue.dismiss()
            })
            .onAppear {
                self.fetchAPIcalls()
            }
        }
    }
    
    private func fetchAPIcalls() {
        // Logic to fetch API calls, possibly from APICallManager or provided data
        self.apiCalls = APICallManager.shared.apiCalls // Example: Assuming APICallManager manages API calls
    }
}
