//
//  AccountUserDefaults.swift
//  TmAuction
//
//  Created by Shirin on 12/22/22.
//

import Foundation

private enum Defaults: String {
    case language = "language"
    case token = "token"
}

class AccUserDefaults {

    static var language: String {
        set { _set(value: newValue, key: .language)  }
        get { return _get(valueForKey: .language) as? String ?? ""}
    }
    
    static var token: String {
        set { _set(value: newValue, key: .token)  }
        get { return _get(valueForKey: .token) as? String ?? ""}
    }
    
}

extension AccUserDefaults {
    private static func _set(value: Any?, key: Defaults) {
        UserDefaults.standard.setValue(value, forKey: key.rawValue)
    }

    private static func _get(valueForKey key: Defaults)-> Any? {
        return UserDefaults.standard.value(forKey: key.rawValue)
    }
}
