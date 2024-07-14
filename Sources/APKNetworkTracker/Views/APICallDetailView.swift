//
//  File.swift
//  
//
//  Created by Pavankumar Arepu on 14/07/24.
//
// Sources/APKNetworkTracker/Views/APICallDetailView.swift

import Foundation
import SwiftUI

public struct APICallDetailView: View {
    
    public let apiCall: APICall
    @State private var selectedTab = 0
    
    public var body: some View {
        VStack {
            Picker(selection: $selectedTab, label: Text("Select a segment")) {
                Text("Request").tag(0)
                Text("Response").tag(1)
                Text("Response Data").tag(2)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            ScrollView {
                switch selectedTab {
                case 0:
                    RequestSegmentView(request: apiCall.request)
                case 1:
                    if let response = apiCall.response {
                        ResponseSegmentView(response: response)
                    } else {
                        Text("No response available")
                    }
                case 2:
                    if let responseData = apiCall.responseData {
                        ResponseDataSegmentView(responseData: responseData)
                    } else {
                        Text("No response data available")
                    }
                default:
                    Text("Invalid selection")
                }
            }
        }
        .padding()
        .navigationBarTitle(Text("API Call Details"), displayMode: .inline)
    }
}

struct RequestSegmentView: View {
    let request: URLRequest
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("API Request")
                .font(.title)
                .padding(.bottom)
            
            Text(request.description)
                .padding(.bottom)
                .background(Color(.systemGray6))
                .cornerRadius(8)
        }
        .padding()
    }
}

struct ResponseSegmentView: View {
    let response: HTTPURLResponse
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("API Response")
                .font(.title)
                .padding(.bottom)
            
            Text(response.description)
                .padding(.bottom)
                .background(Color(.systemGray6))
                .cornerRadius(8)
        }
        .padding()
    }
}

struct ResponseDataSegmentView: View {
    let responseData: Data
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Response Data (JSON)")
                .font(.title)
                .padding(.bottom)
            
            Text(String(data: responseData, encoding: .utf8) ?? "Failed to decode response data")
                .padding(.bottom)
                .background(Color(.systemGray6))
                .cornerRadius(8)
        }
        .padding()
    }
}
