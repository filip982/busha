//
//  ActivityIndicatorView.swift
//  Busha
//
//  Created by Filip Miladinovic on 13.10.22.
//

import UIKit
import SwiftUI

struct ActivityIndicatorView: UIViewRepresentable {
    typealias ViewType = UIActivityIndicatorView

    let style: UIActivityIndicatorView.Style
    @Binding var color: Color

    func makeUIView(context: Context) -> ViewType {
        return UIActivityIndicatorView(style: style)
    }

    func updateUIView(_ uiView: ViewType, context: Context) {
        uiView.startAnimating()
        uiView.color = color.uiColor
    }
}

extension Color {
    var uiColor: UIColor {
        return UIColor(self)
    }
}
