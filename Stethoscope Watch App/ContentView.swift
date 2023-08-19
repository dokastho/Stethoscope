//
//  ContentView.swift
//  Stethoscope Watch App
//
//  Created by TJ Dokas on 8/19/23.
//

import SwiftUI

struct ContentView: View {
    var text: String
    var icon: Image
    var body: some View {
        VStack {
            icon
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text(text)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let image_name = "globe"
        let preview_img = Image(systemName: image_name)
        ContentView(text: "Hello, World!", icon: preview_img)
    }
}
