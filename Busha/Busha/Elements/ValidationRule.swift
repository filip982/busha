//
//  ValidationRule.swift
//  Busha
//
//  Created by Filip Miladinovic on 19.10.22.
//

import Foundation

protocol ValidationRule {
    func isValid(value: Any?) -> Bool
}

struct EmailValidationRule: ValidationRule {

    // MARK: - ValidationRule
    func isValid(value: Any?) -> Bool {
        guard let value = value as? String, !value.isEmpty else { return false }

        guard !value.isEmpty else { return false }
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)

        return predicate.evaluate(with: value)
    }

}

struct PhoneNumberValidationRule: ValidationRule {

    // MARK: - ValidationRule
    func isValid(value: Any?) -> Bool {
        guard let value = value as? String, !value.isEmpty else { return false }

        let regex = #"^\([0-9]{3}\) [0-9]{3}-[0-9]{4}$"#
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with: value)
    }

}

