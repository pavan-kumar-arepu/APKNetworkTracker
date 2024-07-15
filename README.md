
## APKNetworkTracker
Description:
APKNetworkTracker is a Swift package that has been gaining attention in the iOS development community. Inspired by 'NetFox', a well-known package for network debugging, APKNetworkTracker provides a more customizable solution (written in SwiftUI) for tracking API calls within your iOS apps. Whether you're dealing with a difficult API or simply want to monitor your network traffic, APKNetworkTracker has got you covered.

## Why Choose APKNetworkTracker?
In some organizations, integrating third-party packages might not be the preferred approach due to various reasons such as security concerns, customization needs, or company policies. This is where APKNetworkTracker excels. It offers the flexibility to customize the tool according to your project’s specific needs.

## Empower Your QA Teams: 
- Allows QA testers to verify API calls and responses independently, without involving developers.
- Debugging Made Easy: Developers can identify and resolve issues faster by viewing API responses in real-time within the app.
- Transparency Like Never Before: Provides a detailed log of all API interactions, making troubleshooting straightforward.
- Ease of Integration: Written in SwiftUI, making it simple to integrate and activate.

## How Does It Work?
APKNetworkTracker intercepts your application’s network requests, logs the details, and provides a user interface to view these logs. With a simple double-tap (handled by the client app with a provided sample code snippet), users can pull up a modal displaying all tracked API calls, their requests, and responses.

## Animation Video 


## Screenshots 

<p align="center">
  <img src="https://github.com/user-attachments/assets/d3ec44d4-c643-42a7-9bfd-3481b958b468" alt="Image loading Swiftly" width="45%" />
  <span style="display:inline-block; width:40px;"></span>
  <img src="https://github.com/user-attachments/assets/c76ba081-f725-4ed4-9fa8-92724b8f8f81" alt="On DoubleTap Show API Calls" width="45%" />
    <span style="display:inline-block; width:40px;"></span>
  <img src="https://github.com/user-attachments/assets/98316909-a5af-46c1-a53f-103485082478" alt="Selected API Call Reqeust" width="45%" />
    <span style="display:inline-block; width:40px;"></span>
      <img src="https://github.com/user-attachments/assets/487e96d0-a4bb-4d17-b914-9c9906fe132d" alt="Selected API Call Response" width="45%" />
</p>

## Getting Started with APKNetworkTracker
You can integrate APKNetworkTracker into your project using Swift Package Manager (SPM). The package is hosted on GitHub.

- SwiftUI Integration Example
```import SwiftUI
import APKNetworkTracker

struct ContentView: View {
    @ObservedObject var viewModel: AnyViewModelClass // Replace with your actual ViewModel class
    @State private var isModalPresented = false

    init(viewModel: AnyViewModelClass) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            YourMainView(viewModel: viewModel) // Replace with your actual main view
                .onTapGesture(count: 2) {
                    isModalPresented = true
                }
        }
        .sheet(isPresented: $isModalPresented) {
            APICallModalView()
        }
        .onAppear {
            APITracker.isTrackingEnabled = true
            APITracker.startTracking()
        }
        .onDisappear {
            APITracker.stopTracking()
        }
    }
}

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: AnyViewModelClass()) // Replace with your ViewModel initializer
        }
    }
}
```
- Regular Swift Applications Example
```
import UIKit
import SwiftUI

class MainViewController: UIViewController {
    
    var viewModel: AnyViewModelClass! // Replace with your actual ViewModel class
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        // Setup gesture recognizer
        let doubleTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTap))
        doubleTapGesture.numberOfTapsRequired = 2
        view.addGestureRecognizer(doubleTapGesture)
        
        // Start API tracking
        APITracker.isTrackingEnabled = true
        APITracker.startTracking()
        
        // Add your main view using SwiftUI
        let mainView = YourMainView(viewModel: viewModel) // Replace with your actual main view
        let hostingController = UIHostingController(rootView: mainView)
        
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        hostingController.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        hostingController.didMove(toParent: self)
    }
    
    @objc func handleDoubleTap() {
        APITracker.showAPICallModal()
    }
    
    deinit {
        // Stop API tracking
        APITracker.stopTracking()
    }
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var viewModel = AnyViewModelClass() // Replace with your ViewModel initializer

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        let rootViewController = MainViewController()
        rootViewController.viewModel = viewModel
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()

        return true
    }
}
```
## A Word of Caution
While APKNetworkTracker is a powerful tool, it’s still a work in progress. It performs well with SwiftUI applications, but there might be some compatibility issues with Objective-C or older versions of Swift. We’re constantly working on improving it, and your feedback is always welcome.




