//
//  MoreView.swift
//  MortyUI
//
//  Created by Shams Ahmed on 04/02/2021.
//

import SwiftUI
import UIKit

struct MoreView: View {
    
    // MARK: - View
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Configuration")) {
                    Text(configurationType)
                }
                Section(header: Text("Application support directory")) {
                    ForEach(crashDirectory, id: \.self) { name in
                        Button(name) {
                            share(file: name)
                        }.disabled(!name.contains("."))
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("More")
        }
    }
    
    // MARK: - Share
    
    func share(file path: String) {
        let root = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true)[0]
        let file = root + "/" + path
        let url = URL(fileURLWithPath: file)
        let viewController = UIActivityViewController(
            activityItems: [url],
            applicationActivities: nil
        )
        
        UIApplication.shared.windows.first?.rootViewController?.present(
            viewController,
            animated: true,
            completion: nil
        )
    }
    
    // MARK: - Configuration
    
    private var crashDirectory: [String] {
        let path = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true)[0]
        let paths = try! FileManager.default.subpathsOfDirectory(atPath: path)
        
        return paths
    }
    
    private var configurationType: String {
        var configurationType = "Unknown"
        
        #if Debug || DEBUG || debug
        configurationType = "Debug mode"
        #else
        configurationType = "Release mode"
        #endif
        
        return configurationType
    }
}

struct MoreView_Previews: PreviewProvider {
    static var previews: some View {
        MoreView()
    }
}
