//
//  PrimaryTextField.swift
//

import SwiftUI

struct PrimaryTextField: View {
    enum TFType {
        case normal
        case email
        case secure
    }
    enum TFState {
        case `default`
        case disabled
        case error
    }

    private var type: TFType
    private var header: String
    private var placeholder: String
    private var error: String

    public init(
        type: TFType = .normal,
        header: String = "",
        placeholder: String,
        error: String = ""
    ) {
        self.type = type
        self.header = header
        self.placeholder = placeholder
        self.error = error
    }

    @State var state: TFState = .default
    @State var isValid: Bool = true
    @State var text: String = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(header)
                .textStyle(TextStyle.body1Bold)
                .foregroundColor(Color.TextField.headerText)

            HStack {
                switch type {
                case .secure:
                    secureTextFieldView
                case .normal, .email:
                    defaultTextFieldView
                }
            }
            .background(Color.white01)
            .overlay(
                RoundedRectangle(cornerRadius: 2)
                    .stroke(Color.TextField.border.normalState, lineWidth: 2)
            )

            if error.isNotEmpty {
                Text(error)
                    .textStyle(TextStyle.cap)
                    .foregroundColor(Color.TextField.errorText)
                    .padding(.top, 12)
            }
        }
        .onAppear {
            if text.isNotEmpty {
                validate()
            }
        }
    }

    // MARK: - Private API

    private func validate() {
        // TODO: add more validators in the future
        guard type == .email else { return }
        let validationRule = EmailValidationRule()
        isValid = validationRule.isValid(value: text)
    }

    private var defaultTextFieldView: some View {
        TextField(placeholder, text: $text, onEditingChanged: { editing in
            validate()
        })
        .frame(height: 51)
        .padding(.horizontal, 10)
        .font(TextStyle.body1.font)
        .foregroundColor(Color.TextField.placeholderText.normalState)
        .onChange(of: text) { newValue in
            validate()
        }
        .autocapitalization(type == .email ? .none : .sentences)
        .keyboardType(type == .email ? .emailAddress : .default)
    }

    private var secureTextFieldView: some View {
        SecureField(placeholder, text: $text)
            .frame(height: 51)
            .padding(.horizontal, 10)
            .font(TextStyle.body1.font)
            .foregroundColor(Color.TextField.placeholderText.normalState)
            .onChange(of: text) { newValue in
                validate()
            }
    }

}

struct PrimaryTextField_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            PrimaryTextField(type: .email, header: "", placeholder: "Email")
            PrimaryTextField(type: .secure, header: "", placeholder: "Password")
            PrimaryTextField(type: .email, header: "", placeholder: "Email", error: "E-mail format incorrect")
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
