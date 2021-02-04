//
//  MoreView.swift
//  MortyUI
//
//  Created by Shams Ahmed on 04/02/2021.
//

import SwiftUI

struct MoreView: View {
    
    // MARK: - View
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Configuration")) {
                    Text(configurationType)
                }
                Section(header: Text("Application support directory")) {
                    ForEach(crashDirectory, id: \.self) { string in
                        Text(string)
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("More")
        }
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
