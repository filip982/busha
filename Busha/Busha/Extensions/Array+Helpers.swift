//
//  Array+Helpers.swift
//  Busha
//
//  Created by Filip Miladinovic on 20.10.22.
//

import Foundation

extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }

    var isNotEmpty: Bool {
        return !isEmpty
    }
}
