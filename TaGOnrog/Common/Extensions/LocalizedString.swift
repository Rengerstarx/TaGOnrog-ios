//
//  LocalizedString.swift
//  TaGOnrog
//
//  Created by Сергей Бекезин on 31.01.2024.
//

import Foundation

extension String {
    
    func capitalizeFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    
    enum Common: String {
        case termsOfUsage
        case privacyPolicy
        case cancelTitle
    }
    
}

extension RawRepresentable {
    
    func format(_ args: CVarArg...) -> String {
        let format = ^self
        return String(format: format, arguments: args)
    }
    
}

prefix operator ^
prefix func ^<Type: RawRepresentable> (_ value: Type) -> String {
    if let raw = value.rawValue as? String {
        let key = raw.capitalizeFirstLetter()
        return NSLocalizedString(key, comment: "")
    }
    return ""
}

