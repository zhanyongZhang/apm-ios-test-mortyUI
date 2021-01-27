//
//  Crash.swift
//  MortyUI
//
//  Created by Shams Ahmed on 22/01/2021.
//

import Foundation

@inline(__always)
func fatalErrorCrash() {
    fatalError("The app has crashed")
}

struct Crash {
    
    // MARK: - Crashes
    
    @inline(never)
    static func objcOutOfBoundCrash() {
        let list = NSArray()
        _ = list[.max]
    }
    
    @inline(__always)
    static func outOfBoundCrash() {
        let list = [Int]()
        _ = list[.max]
    }
    
    static func forceUnwrapCrash() {
        let str: Any! = "my string here"
        _ = (str as! Int) + 10
    }
    
    static func backgroundThreadCrash() {
        DispatchQueue.global(qos: .background).async {
            Crash.forceUnwrapCrash()
        }
    }
    
    @inline(__always)
    static func mainThreadCrash() {
        DispatchQueue.main.sync {
            DispatchQueue.main.sync {
                DispatchQueue.main.sync { }
            }
        }
    }
    
    static func crash() {
        abort()
    }
}
