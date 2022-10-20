//
//  SpacingType.swift
//

import SwiftUI

public enum SpacingType {
    case zeroSpace
    case xxs
    case xs
    case base
    case xl
    case xxl
    case xxxl
    case xxxxl

    var length: CGFloat {
        switch self {
        case .zeroSpace:
            return 0
        case .xxs:
            return 4
        case .xs:
            return 8
        case .base:
            return 16
        case .xl:
            return 24
        case .xxl:
            return 32
        case .xxxl:
            return 64
        case .xxxxl:
            return 80
        }
    }
}

extension View {
    public func padding(_ type: SpacingType) -> some View {
        padding(type.length)
    }

    public func padding(_ edges: Edge.Set = .all, type: SpacingType) -> some View {
        padding(edges, type.length)
    }
}

