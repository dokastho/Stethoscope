//
//  StethoscopeApp.swift
//  Stethoscope Watch App
//
//  Created by TJ Dokas on 8/19/23.
//

import SwiftUI
import UIKit

enum STATUS: String {
case UP = "Up"
case DOWN = "Down"
case LOADING = "Loading"
}

struct ServerStatus {
    var status: STATUS
    var icon: Image
}

@main
struct Stethoscope_Watch_AppApp: App {
    var stat: ServerStatus = get_status(<#T##self: Stethoscope_Watch_AppApp##Stethoscope_Watch_AppApp#>)()
    var body: some Scene {
        WindowGroup {
            ContentView(text: stat.status.rawValue, icon: stat.icon)
        }
    }
    
    func get_status() -> ServerStatus {
        var stat = ServerStatus(status: STATUS.LOADING, icon: Image(systemName: "loading")) // placeholder value
        
        let url = URL(string: "https://dokasfam.com:4221")!
        
        let task = URLSession.shared.dataTask(with: url) {data, response, error in
            if let data = data {
                print("success")
                stat.status = STATUS.UP
                stat.icon = Image(systemName: "checkmark") // placeholder value
            } else if let error = error {
                print("fail: \(error)")
                stat.status = STATUS.DOWN
                stat.icon = Image(systemName: "fail") // placeholder value
            }
        }
        
        task.resume()
        
        return stat
    }
}
