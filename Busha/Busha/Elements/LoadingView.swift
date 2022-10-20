//
//  LoadingView.swift
//  Busha
//
//

import SwiftUI

struct LoadingView: View {
    var strokeColor: Color

    @State var degrees: Double = 0

    var body: some View {
        Circle()
            .trim(from: 0.2, to: 1)
            .stroke(strokeColor, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
            .frame(width: 15, height: 15)
            .rotationEffect(Angle(degrees: degrees))
            .onAppear {
                withAnimation(Animation.linear(duration: 1)
                    .repeatForever(autoreverses: false)) {
                        degrees = 360
                    }
            }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(strokeColor: Color.gray)
    }
}
