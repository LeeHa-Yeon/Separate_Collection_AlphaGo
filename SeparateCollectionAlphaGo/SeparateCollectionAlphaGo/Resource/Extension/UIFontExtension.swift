//
//  UIFontExtension.swift
//  SeparateCollectionAlphaGo
//
//  Created by 이숭인 on 2021/12/16.
//
import UIKit

enum FontType {
    case SDBold, SDMed, SDReg, SDHeader
}

extension UIFont {
    static func TTFont(type: FontType, size: CGFloat) -> UIFont {
        var fontName = ""
        switch type {
        case .SDBold:
            fontName = "AppleSDGothicNeo-Bold"
        case .SDMed:
            fontName = "AppleSDGothicNeo-Medium"
        case .SDReg:
            fontName = "AppleSDGothicNeo-Regular"
        case .SDHeader:
            fontName = "AppleSDGothicNeo-BOLD"
        }
        
        return UIFont(name: fontName, size: size) ?? UIFont.systemFont(ofSize: size)
    }
}
