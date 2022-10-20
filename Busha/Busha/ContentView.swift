//
//  ContentView.swift
//  Busha
//
//  Created by Filip Miladinovic on 21.12.20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(.whiteMain)
            VStack(spacing: 24) {
                Circle()
                    .fill(Color.white)
                    .frame(width: 200, height: 200)
            }
        }
        .padding(20)
        .previewLayout(.sizeThatFits)
        .environment(\.colorScheme, .dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
