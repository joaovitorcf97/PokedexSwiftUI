//
//  FontMaker.swift
//  PokedexSwiftUI
//
//  Created by João Vitor Costa Ferreira on 05/10/24.
//

import Foundation
import SwiftUI

public enum fontNames: String {
    case poppinsLight = "Poppins-Light"
    case poppinsRegular = "Poppins-Regular"
    case poppinsMedium = "Poppins-Medium"
    case poppinsSemiBold = "Poppins-SemiBold"
    case poppinsBold = "Poppins-Bold"
}

struct FontMaker {
    static func makeFont(_ font: fontNames, _ size: CGFloat) -> Font {
        Font.custom(font.rawValue, size: size)
    }
}
