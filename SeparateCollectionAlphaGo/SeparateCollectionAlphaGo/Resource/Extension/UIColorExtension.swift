//
//  UIColorExtension.swift
//  SeparateCollectionAlphaGo
//
//  Created by 이숭인 on 2021/12/16.
//
import UIKit

extension UIColor {
    
    //MARK:- Background
    class Background: UIColor {
        static let black02 = UIColor(red: 0.09 , green: 0.09, blue: 0.09, alpha: 1.0)
        static let darkGray01 = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1.0)
        static let darkGray02 = UIColor(red: 31/255, green: 31/255, blue: 31/255, alpha: 1.0)
    }
    
    // MARK: - Basic
    class Basic: UIColor {
        static let black01 = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0)
        static let gray01 = UIColor(red: 0.229, green: 0.229, blue: 0.229, alpha: 1.0)
        static let gray02 = UIColor(red: 0.275, green: 0.275, blue: 0.275, alpha: 1.0)
        static let gray03 = UIColor(red: 0.384, green: 0.384, blue: 0.384, alpha: 1.0)
        static let gray04 = UIColor(red: 0.654, green: 0.654, blue: 0.654, alpha: 1.0)
        static let gray05 = UIColor(red: 0.946, green: 0.946, blue: 0.946, alpha: 1.0)
        static let gray06 = UIColor(red: 184/255, green: 184/255, blue: 184/255, alpha: 1.0)
    }
    
    // MARK: - Point
    class Point: UIColor {
        static let or01 = UIColor(red: 254/255, green: 107/255, blue: 0/255, alpha: 1.0)
        static let or02 = UIColor(red: 255/255, green: 138/255, blue: 0/255, alpha: 1.0)
        static let orGra01 = UIColor(red: 0.996, green: 0.418, blue: 0, alpha: 1.0)
        static let orGra02 =  UIColor(red: 1.0, green: 0.54, blue: 0, alpha: 1.0)
        static let pink = UIColor(red: 255/255, green: 87/255, blue: 87/255, alpha: 1.0)
        static let green01 = UIColor(red: 0.152, green: 0.684, blue: 0.524, alpha: 1.0)
    }
    
    //MARK: - Opacity
    class Opacity: UIColor {
        static let white90 = UIColor(red: 255/255, green: 249/255, blue: 249/255, alpha: 0.9)
        static let black30 = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.3)
        static let black70 = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.7)
        static let black80 = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.8)
        static let black90 = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.9)
        static let or0190 = UIColor(red: 254/255, green: 107/255, blue: 0/255, alpha: 0.9)
    }
    
    //MAKR: - AppendIx
    class AppendIx: UIColor {
        static let lightMint = UIColor(red: 0.943, green: 0.996, blue: 0.996, alpha: 1.0)
        static let greenMint = UIColor(red: 0.316, green: 0.879, blue: 0.677, alpha: 1.0)
    }
}
