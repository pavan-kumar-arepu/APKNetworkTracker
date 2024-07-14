//
//  File.swift
//  
//
//  Created by Pavankumar Arepu on 14/07/24.
//

import Foundation
import UIKit

class APICallModalViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Customize your modal view controller as needed
        view.backgroundColor = .white
        
        // Example: Add a label to indicate API call details
        let label = UILabel()
        label.text = "Tracked API Calls"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    // Implement other methods as needed
}
