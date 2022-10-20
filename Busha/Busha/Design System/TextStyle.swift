//
//  TextStyle.swift
//

import SwiftUI

extension Text {
    public func textStyle(_ style: TextStyle) -> some View {
        return font(style.font)
            .kerning(style.kerning)
    }
}

public enum TextStyle {
    case body2
    case body2Bold
    case overline
    case cap
    case h1
    case h2
    case h3
    case h4
    case button
    case body1
    case body1Bold

    var font: Font {
        return Font.custom("Roboto", size: fontSize, relativeTo: textStyle)
    }

    var fontSize: CGFloat {
        switch self {
        case .body2:
            return 14
        case .body2Bold:
            return 14
        case .overline:
            return 11
        case .cap:
            return 13
        case .h1:
            return 32
        case .h2:
            return 24
        case .h3:
            return 21
        case .h4:
            return 18
        case .button:
            return 16
        case .body1:
            return 16
        case .body1Bold:
            return 16
        }
    }

    var kerning: CGFloat {
        switch self {
        case .overline:
            return 2.64
        case .h4:
            return -0.36
        case .h3:
            return -0.42
        case .h1:
            return -0.64
        case .h2:
            return -0.48
        default:
            return 0
        }
    }

    var textStyle: Font.TextStyle {
        switch self {
        case .h1:
            return .largeTitle   // regular, 34pt
        case .h2:
            return .title       // regular, 28pt
        case .h3:
            return .title2      // regular, 22pt
        case .h4:
            return .title3      // regular, 20pt
        case .body1Bold:
            return .headline    // semibold, 17pt
        case .body1:
            return .body        // regular, 17pt
        case .button:
            return .callout     // regular, 16pt
        case .body2, .body2Bold:
            return .subheadline  // regular, 15pt
//        case _:
//            return .footnote     // regular, 13pt
        case .cap:
            return .caption     // regular, 12pt
        case .overline:
            return .caption2    // regular, 11pt
        }
    }
}


extension TextStyle: CustomDebugStringConvertible {
    public var debugDescription: String {
        ".\(rawValue) \(fontSize)pt, \(kerning) kerning"
    }

    var rawValue: String {
        switch self {
        case .body2: return "body 2"
        case .body2Bold: return "body 2 Bold"
        case .overline: return "overline"
        case .cap: return "caption"
        case .h1: return "heading1"
        case .h2: return "heading2"
        case .h3: return "heading3"
        case .h4: return "heading4"
        case .button: return "button"
        case .body1: return "body 1"
        case .body1Bold: return "body 1 Bold"
        }
    }
}

// MARK: - Previews

struct TextStyles_Previews: PreviewProvider {
    static var previews: some View {

        Group {
            ZStack {
                Color(.whiteMain)
                VStack(spacing: 24) {
                    Group {
                        textPreview(lorem(), style: .body2Bold)
                        textPreview(lorem(), style: .body2)
                        textPreview(lorem(), style: .overline)
                        textPreview(lorem(), style: .cap)
                        textPreview(lorem(), style: .h4)
                        textPreview(lorem(), style: .h3)
                        textPreview(lorem(), style: .h1)
                        textPreview(lorem(), style: .h2)
                        textPreview(lorem(), style: .button)
                    }
                    Group {
                        textPreview(lorem(), style: .body1Bold)
                        textPreview(lorem(), style: .body1)
                    }
                }
            }
            .padding(20)
            .previewLayout(.sizeThatFits)
        }

        ZStack {
            Color(.whiteMain)
            VStack(spacing: 24) {
                Group {
                    textPreview(lorem(), style: .body2Bold)
                    textPreview(lorem(), style: .body2)
                    textPreview(lorem(), style: .overline)
                    textPreview(lorem(), style: .cap)
                    textPreview(lorem(), style: .h4)
                    textPreview(lorem(), style: .h3)
                    textPreview(lorem(), style: .h1)
                    textPreview(lorem(), style: .h2)
                    textPreview(lorem(), style: .button)
                }
                Group {
                    textPreview(lorem(), style: .body1Bold)
                    textPreview(lorem(), style: .body1)
                }
            }
        }
        .padding(20)
        .previewLayout(.sizeThatFits)
        .environment(\.colorScheme, .dark)
        .previewDisplayName("Dark Mode")
    }

    static func textPreview(_ text: String, style: TextStyle) -> some View {
        VStack(spacing: 8) {
            Text(text)
                .textStyle(style)
                .fixedSize(horizontal: false, vertical: true)

            Text(style.debugDescription)
                .font(.caption)
                .fixedSize(horizontal: false, vertical: true)

            Divider()
        }
    }
    static func lorem() -> String {
        String("The quick brown fox jumps over the lazy dog.")
    }
}
