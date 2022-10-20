//
//  ButtonStyles.swift
//  Busha
//
//  Created by Filip Miladinovic on 13.10.22.
//

import Foundation
import SwiftUI

// MARK: - Base Action Button

struct BaseActionButton: View {
    static let cornerRadius: CGFloat = 100
    static let secondaryCornerRadius: CGFloat = 3
    static let borderWidth: CGFloat = 2.0
    static let noBorder: CGFloat = 0.0

    private let label: ButtonStyleConfiguration.Label
    private let style: Style
    private let width: CGFloat?
    private let padding: CGFloat
    private let font: Font

    enum Style {
        case small
        case large

        var height: CGFloat {
            switch self {
            case .small:        return 39
            case .large:        return 51
            }
        }
    }

    init(
        label: ButtonStyleConfiguration.Label,
        font: Font,
        style: Style,
        width: CGFloat? = nil,
        padding: CGFloat = 16
    ) {
        self.label = label
        self.font = font
        self.style = style
        self.width = width
        self.padding = padding
    }

    var body: some View {
        HStack {
            if padding > 0 {
                Spacer()
            }
            label.font(font)
            if padding > 0 {
                Spacer()
            }
        }
        .padding(padding)
        .frame(width: width, height: style.height, alignment: .center)
    }
}

// MARK: - Primary Button Style

struct PrimaryButtonStyle: ButtonStyle {
    let style: BaseActionButton.Style
    let isEnabled: Bool

    // Background color
    private let normalBackground: Color = Color.Button.Primary.background.normalState
    private let highlightedBackground: Color = Color.Button.Primary.background.highlightedState
    private let disabledBackground: Color = Color.Button.Primary.background.disableState
    // Text color
    private let normalTextColor: Color = Color.Button.Primary.text.normalState
    private let highlightedTextColor: Color = Color.Button.Primary.text.highlightedState
    private let disabledTextColor: Color = Color.Button.Primary.text.disableState
    // border color
    private let normalBorderColor: Color = Color.Button.Primary.border.normalState
    private let highlightedBorderColor: Color = Color.Button.Primary.text.highlightedState
    private let disabledBorderColor: Color = Color.Button.Primary.text.disableState

    private func backgroundView(_ configuration: Self.Configuration) -> some View {
        RoundedRectangle(cornerRadius: BaseActionButton.cornerRadius)
            .stroke(isEnabled ? (configuration.isPressed ? highlightedBorderColor : normalBorderColor) : disabledBorderColor,
                    lineWidth: BaseActionButton.borderWidth)
            .background(isEnabled ? (configuration.isPressed ? highlightedBackground : normalBackground) : disabledBackground)
    }

    func makeBody(configuration: Self.Configuration) -> some View {
        BaseActionButton(label: configuration.label, font: TextStyle.button.font, style: style)
            .foregroundColor(isEnabled ? (configuration.isPressed ? highlightedTextColor : normalTextColor) : disabledTextColor)
            .background(backgroundView(configuration))
            .clipShape(RoundedRectangle(cornerRadius: BaseActionButton.cornerRadius))
    }
}

// MARK: - Secondary Button Style

struct SecondaryButtonStyle: ButtonStyle {
    let style: BaseActionButton.Style
    let isEnabled: Bool

    // Background color
    private let normalBackground: Color = Color.Button.Secondary.background.normalState
    private let highlightedBackground: Color = Color.Button.Secondary.background.highlightedState
    private let disabledBackground: Color = Color.Button.Secondary.background.disableState
    // Text color
    private let normalTextColor: Color = Color.Button.Secondary.text.normalState
    private let highlightedTextColor: Color = Color.Button.Secondary.text.highlightedState
    private let disabledTextColor: Color = Color.Button.Secondary.text.disableState
    // border color
    private let normalBorderColor: Color = Color.Button.Secondary.border.normalState
    private let highlightedBorderColor: Color = Color.Button.Secondary.border.highlightedState
    private let disabledBorderColor: Color = Color.Button.Secondary.border.disableState

    private func backgroundView(_ configuration: Self.Configuration) -> some View {
        RoundedRectangle(cornerRadius: BaseActionButton.cornerRadius)
            .stroke(isEnabled ? (configuration.isPressed ? highlightedBorderColor : normalBorderColor) : disabledBorderColor,
                    lineWidth: BaseActionButton.borderWidth)
            .background(isEnabled ? (configuration.isPressed ? highlightedBackground : normalBackground) : disabledBackground)
    }

    func makeBody(configuration: Self.Configuration) -> some View {
        BaseActionButton(label: configuration.label, font: TextStyle.button.font, style: style)
            .foregroundColor(isEnabled ? (configuration.isPressed ? highlightedTextColor : normalTextColor) : disabledTextColor)
            .background(backgroundView(configuration))
            .clipShape(RoundedRectangle(cornerRadius: BaseActionButton.cornerRadius))
    }
}

