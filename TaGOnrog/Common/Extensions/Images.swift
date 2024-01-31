//
//  Images.swift
//  TaGOnrog
//
//  Created by Сергей Бекезин on 31.01.2024.
//
import UIKit

enum AppImage: String {
    
    //Launchscreen
    case launchscreenAppLogo
    
    var uiImage: UIImage? {
        return UIImage(systemName: rawValue) ?? UIImage(named: rawValue)
    }
    
    func uiImageWith(font: UIFont? = nil, tint: UIColor? = nil) -> UIImage? {
        var img = uiImage
        if let font = font {
            img = img?.withConfiguration(UIImage.SymbolConfiguration(font: font))
        }
        if let tint = tint {
            return img?.withTintColor(tint, renderingMode: .alwaysOriginal)
        } else {
            return img
        }
    }
    
}
