//
//  BushaApp.swift
//  Busha
//
//  Created by Filip Miladinovic on 21.12.20.
//

import SwiftUI

@main
struct BushaApp: App {

    @State var isPushingView: Bool = false

    var body: some Scene {
        WindowGroup {
            NavigationView {
                ZStack {
                    NavigationLink(destination: Color.green, isActive: $isPushingView) {
                        Color.clear
                    }
                    ContentView(isPushingView: $isPushingView)
                }
            }
        }
    }
}

// 1
// 2

// 6
// 7
