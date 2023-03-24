//
//  Encodable.swift
//  BaseApp
//
//  Created by Shirin on 3/24/23.
//

import Foundation

extension Encodable {
    var dictionary: [String: String?]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments))
                    .flatMap { $0 as? [String: String?] }
    }
}
