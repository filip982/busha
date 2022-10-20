//
//  Colors.swift
//

import SwiftUI

extension Color {
    private static let primary50 = Color("primary-50")
    private static let primary100 = Color("primary-100")
    private static let primary200 = Color("primary-200")
    private static let primary300 = Color("primary-300")
    private static let primary400 = Color("primary-400")
    private static let primary500 = Color("primary-500")
    private static let primary600 = Color("primary-600")
    private static let primary700 = Color("primary-700")
    private static let primary800 = Color("primary-800")
    private static let primary900 = Color("primary-900")

    private static let gray50 = Color("gray-50")
    private static let gray100 = Color("gray-100")
    private static let gray200 = Color("gray-200")
    private static let gray300 = Color("gray-300")
    private static let gray400 = Color("gray-400")
    private static let gray500 = Color("gray-500")
    private static let gray600 = Color("gray-600")
    private static let gray700 = Color("gray-700")
    private static let gray800 = Color("gray-800")
    private static let gray900 = Color("gray-900")

    private static let danger50 = Color("danger-50")
    private static let danger100 = Color("danger-100")
    private static let danger200 = Color("danger-200")
    private static let danger300 = Color("danger-300")
    private static let danger400 = Color("danger-400")
    private static let danger500 = Color("danger-500")
    private static let danger600 = Color("danger-600")
    private static let danger700 = Color("danger-700")
    private static let danger800 = Color("danger-800")
    private static let danger900 = Color("danger-900")

}

extension Color {
    public static let white01 = Color("white-01")
    public static let black01 = Color("black-01")

    public static let primaryColor = Color.primary500
    public static let primaryDisableColor = Color.gray300

    public enum Button {
        enum Primary {
            enum background {
                static let normalState = Color.primaryColor
                static let highlightedState = Color.primary600
                static let disableState = Color.gray300
            }
            enum text {
                static let normalState = Color.white01
                static let highlightedState = Color.white01
                static let disableState = Color.gray400
            }
            enum border {
                static let normalState = Color.primaryColor
                static let highlightedState = Color.primary600
                static let disableState = Color.gray300
            }
        }
        enum Secondary {
            enum background {
                static let normalState = Color.white01
                static let highlightedState = Color.primary50
                static let disableState = Color.gray100
            }
            enum text {
                static let normalState = Color.black01
                static let highlightedState = Color.black01
                static let disableState = Color.gray300
            }
            enum border {
                static let normalState = Color.primaryColor
                static let highlightedState = Color.primary600
                static let disableState = Color.gray300
            }
        }
    }

    public enum TextField {
        static let headerText = Color.gray700
        enum placeholderText {
            static let normalState = Color.gray700
            static let disableState = Color.gray200
            static let errorState = Color.gray700
        }
        enum border {
            static let normalState = Color.gray200
            static let disableState = Color.gray200
            static let errorState = Color.danger600
        }
        enum background {
            static let normalState = Color.white01
            static let disableState = Color.gray50
            static let errorState = Color.white01
        }
        static let errorText = Color.danger600

    }
}

extension UIColor {
    public static let whiteMain = UIColor(named: "white-main") ?? .white
}

extension Color {
    var name: String {
        switch self {
        case Color.white01: return "white-01"
        case Color.primaryColor: return "primary-500"
        default: return "N/A"
        }
    }
}

// MARK: - Previews

struct ColorStyle_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(.whiteMain)
            VStack(spacing: 24) {
                Group {
                    colorPreview(Color.white01)
                    colorPreview(Color.primaryColor)
                }
            }
        }
        .padding(20)
        .previewLayout(.sizeThatFits)


        ZStack {
            Color(.whiteMain)
            VStack(spacing: 24) {
                Group {
                    colorPreview(Color.white01)
                    colorPreview(Color.primaryColor)
                }
            }
        }
        .padding(20)
        .previewLayout(.sizeThatFits)
        .environment(\.colorScheme, .dark)
        .previewDisplayName("Dark Mode")
    }

    static func colorPreview(_ color: Color) -> some View {
        VStack(spacing: 8) {
            Text(color.name)
                .fixedSize(horizontal: false, vertical: true)

            Rectangle()
                .fill(color)
                .frame(width: 200, height: 50)
                .fixedSize(horizontal: false, vertical: true)

            Divider()
        }
    }
}
