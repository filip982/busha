//
//  Buttons.swift
//  Busha
//
//  Created by Filip Miladinovic on 12.10.22.
//

import SwiftUI

// MARK: - Primary Button

struct PrimaryButton: View {
    @Environment(\.isEnabled) private var isEnabled
    @Binding var isShowingProgress: Bool

    private let action: () -> Void
    private let leftImage: Image?
    private let title: String
    private var showTitleWithProgress: Bool = false
    private var style: BaseActionButton.Style
    /**
     - parameter leftImage: Image to optionally show to the left of the label
     - parameter titleLocalizationKey: localization key to use for displaying the title, i.e. "Button.Action.Save"
     - parameter action: Code to run when the button is tapped, can include verification and navigation state changes
     */
    public init(
        leftImage: Image? = nil,
        titleLocalizationKey: String,
        style: BaseActionButton.Style = .large,
        showTitleWithProgress: Bool = false,
        isShowingProgress: Binding<Bool> = .constant(false),
        action: @escaping () -> Void
    ) {
        self.leftImage = leftImage
        self.title = NSLocalizedString(titleLocalizationKey, comment: "")
        self.style = style
        self.showTitleWithProgress = showTitleWithProgress
        self._isShowingProgress = isShowingProgress
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            if isShowingProgress {
                HStack(spacing: 8.0) {
                    LoadingView(strokeColor: .white01)
                    if showTitleWithProgress {
                        Text(title.localize())
                    }
                }
            } else {
                HStack(spacing: 8.0) {
                    if let leftImage = leftImage {
                        leftImage
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 16, height: 16)
                    }
                    Text(title.localize())
                }
            }
        }
        .buttonStyle(PrimaryButtonStyle(style: style, isEnabled: isEnabled))
    }
}

// MARK: - Secondary Button

struct SecondaryButton: View {
    @Environment(\.isEnabled) private var isEnabled
    @Binding var isShowingProgress: Bool

    private let action: () -> Void
    private let leftImage: Image?
    private let title: String
    private var showTitleWithProgress: Bool = false
    private var style: BaseActionButton.Style
    /**
     - parameter leftImage: Image to optionally show to the left of the label
     - parameter titleLocalizationKey: localization key to use for displaying the title, i.e. "Button.Action.Save"
     - parameter action: Code to run when the button is tapped, can include verification and navigation state changes
     */
    public init(
        leftImage: Image? = nil,
        titleLocalizationKey: String,
        style: BaseActionButton.Style = .large,
        showTitleWithProgress: Bool = false,
        isShowingProgress: Binding<Bool> = .constant(false),
        action: @escaping () -> Void
    ) {
        self.leftImage = leftImage
        self.title = NSLocalizedString(titleLocalizationKey, comment: "")
        self.style = style
        self.showTitleWithProgress = showTitleWithProgress
        self._isShowingProgress = isShowingProgress
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            if isShowingProgress {
                HStack(spacing: 8.0) {
                    LoadingView(strokeColor: Color.Button.Secondary.text.disableState)
                    if showTitleWithProgress {
                        Text(title.localize())
                    }
                }
            } else {
                HStack(spacing: 8.0) {
                    if let leftImage = leftImage {
                        leftImage
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 16, height: 16)
                    }

                    Text(title.localize())
                }
            }
        }
        .buttonStyle(SecondaryButtonStyle(style: style, isEnabled: isEnabled))
    }
}

// MARK: - Previews

struct Button_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Spacer()
            Text("Primary button set")
            Group {
                PrimaryButton(titleLocalizationKey: "Primary Button") {}
                PrimaryButton(leftImage: Image(systemName: "link"), titleLocalizationKey: "Primary with Image") {}
                PrimaryButton(leftImage: Image("user-plus"), titleLocalizationKey: "Primary with Image") {}
                PrimaryButton(titleLocalizationKey: "Primary Disabled") {}.disabled(true)
                PrimaryButton(titleLocalizationKey: "", isShowingProgress: .constant(true)) {}.disabled(true)
            }
            Divider()
            Spacer()
            Text("Secondary button set")
            Group {
                SecondaryButton(titleLocalizationKey: "Secondary Button") {}
                SecondaryButton(leftImage: Image(systemName: "link"), titleLocalizationKey: "Primary with Image") {}
                SecondaryButton(leftImage: Image("user-plus"), titleLocalizationKey: "Primary with Image") {}
                SecondaryButton(titleLocalizationKey: "Primary Disabled") {}.disabled(true)
                SecondaryButton(titleLocalizationKey: "Primary Disabled", isShowingProgress: .constant(true)) {}.disabled(true)
            }
        }.padding(.base)
        .background(Color.white)
    }
}
