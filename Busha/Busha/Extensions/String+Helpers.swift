//
//  String+Helpers.swift
//

import Foundation

extension String {

    func localize( _ args: CVarArg...) -> String {
        var resultString = String(format: NSLocalizedString(self, comment: ""), arguments: args)
        if resultString == self {
            resultString = Bundle.main.localizedString(forKey: self, value: nil, table: "Accessibility")
        }
        return resultString
    }
}
