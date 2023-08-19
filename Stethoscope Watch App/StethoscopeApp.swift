//
//  StethoscopeApp.swift
//  Stethoscope Watch App
//
//  Created by TJ Dokas on 8/19/23.
//

import SwiftUI

enum STATUS {
case UP
case DOWN
case LOADING
}

struct ServerStatus {
    var status: STATUS
}

@main
struct Stethoscope_Watch_AppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    func get_status() -> ServerStatus {
        var stat = ServerStatus(status: STATUS.LOADING)
        
        let url = URL(string: "https://dokasfam.com:4221")!
        
        let task = URLSession.shared.dataTask(with: url) {data, response, error in
            if let data = data {
                print("success")
            } else if let error = error {
                print("fail: \(error)")
            }
        }
        
        task.resume()
        
        return stat
    }
}
